use starknet::ContractAddress;

#[starknet::interface]
trait IERC20<TContractState> {
    fn name(self: @TContractState) -> felt252;
    fn symbol(self: @TContractState) -> felt252;
    fn decimals(self: @TContractState) -> u8;
    fn total_supply(self: @TContractState) -> u256;
    fn balance_of(self: @TContractState, account: ContractAddress) -> u256;
    fn allowance(self: @TContractState, owner: ContractAddress, spender: ContractAddress) -> u256;
    fn transfer(ref self: TContractState, recipient: ContractAddress, amount: u256) -> bool;
    fn transfer_from(ref self: TContractState, sender: ContractAddress, recipient: ContractAddress, amount: u256) -> bool;
    fn approve(ref self: TContractState, spender: ContractAddress, amount: u256) -> bool;
}

#[starknet::interface]
trait IERC20MintingAndBurning<TContractState> {
    fn mint(ref self: TContractState, recipient: ContractAddress, amount: u256) -> bool;
    fn burn(ref self: TContractState, amount: u256) -> bool;
}


#[starknet::contract]
mod USDCToken {
    use core::traits::Into;
    use starknet::{
        ClassHash, ContractAddress, contract_address_to_felt252, get_caller_address, get_contract_address, Felt252TryIntoContractAddress
    };
    use core::traits::TryInto;
    use array::ArrayTrait;
    use option::OptionTrait;
    use serde::Serde;
    use box::BoxTrait;
    use starknet::storage::{Map, StoragePathEntry};
    use starknet::storage::{StorageMapReadAccess, StorageMapWriteAccess};
    
    #[derive(Drop, starknet::Event)]
    struct Transfer {
        #[key]
        from: ContractAddress,
        #[key]
        to: ContractAddress,
        value: u256,
    }

    #[derive(Drop, starknet::Event)]
    struct Approval {
        #[key]
        owner: ContractAddress,
        #[key]
        spender: ContractAddress,
        value: u256
    }


    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        Transfer: Transfer,
        Approval: Approval,
    }

    #[storage]
    struct Storage {
        _name: felt252,
        _symbol: felt252,
        _decimals: u8,
        _total_supply: u256,
        _balances: Map<ContractAddress, u256>,
        _allowances: Map<(ContractAddress, ContractAddress), u256>,
        _owner: ContractAddress,
    }

    #[constructor]
    fn constructor(ref self: ContractState, owner: ContractAddress) {
        self._name.write('USDC Token');
        self._symbol.write('USDC');
        self._decimals.write(6);
        self._owner.write(owner);
    }

    #[abi(embed_v0)]
    impl MockUSDC of super::IERC20<ContractState> {
        fn name(self: @ContractState) -> felt252 {
            self._name.read()
        }

        fn symbol(self: @ContractState) -> felt252 {
            self._symbol.read()
        }

        fn decimals(self: @ContractState) -> u8 {
            self._decimals.read()
        }

        fn total_supply(self: @ContractState) -> u256 {
            self._total_supply.read()
        }

        fn balance_of(self: @ContractState, account: ContractAddress) -> u256 {
            self._balances.read(account)
        }

        fn allowance(self: @ContractState, owner: ContractAddress, spender: ContractAddress) -> u256 {
            self._allowances.read((owner, spender))
        }

        fn transfer(ref self: ContractState, recipient: ContractAddress, amount: u256) -> bool {
            let sender: ContractAddress = get_caller_address();
            self._transfer(sender, recipient, amount);
            true
        }

        fn transfer_from(ref self: ContractState, sender: ContractAddress, recipient: ContractAddress, amount: u256) -> bool {
            let caller = get_caller_address();
            self._spend_allowance(sender, caller, amount);
            self._transfer(sender, recipient, amount);
            true
        }

        fn approve(ref self: ContractState, spender: ContractAddress, amount: u256) -> bool {
            let caller = get_caller_address();
            self._approve(caller, spender, amount);
            true
        }
    }

    #[abi(embed_v0)]
    impl ERC20MintingBurningImpl of super::IERC20MintingAndBurning<ContractState> {
        fn mint(ref self: ContractState, recipient: ContractAddress, amount: u256) -> bool {
            self._assert_owner();
            self._mint(recipient, amount);
            true
        }
        fn burn(ref self: ContractState, amount: u256) -> bool {
            self._burn(get_caller_address(), amount);
            true
        }
    }

    #[generate_trait]
    impl Private of PrivateTrait {
        fn _transfer(ref self: ContractState, sender: ContractAddress, recipient: ContractAddress, amount: u256) {
            assert(!sender.is_zero(), 'ERC20: transfer from 0');
            assert(!recipient.is_zero(), 'ERC20: transfer to 0');
            self._balances.write(sender, self._balances.read(sender) - amount);
            self._balances.write(recipient, self._balances.read(recipient) + amount);
            self.emit(Transfer { from: sender, to: recipient, value: amount })
        }

        fn _spend_allowance(ref self: ContractState, owner: ContractAddress, spender: ContractAddress, amount: u256) {
            let current_allowance = self._allowances.read((owner, spender));
            let ONES_MASK = 0xffffffffffffffffffffffffffffffff_u256;
            let is_unlimited_allowance = current_allowance == ONES_MASK;
            if !is_unlimited_allowance {
                self._approve(owner, spender, current_allowance - amount);
            }
        }

        fn _approve(ref self: ContractState, owner: ContractAddress, spender: ContractAddress, amount: u256) {
            assert(!owner.is_zero(), 'ERC20: approve from 0');
            assert(!spender.is_zero(), 'ERC20: approve to 0');
            self._allowances.write((owner, spender), amount);
            self.emit(Approval { owner: owner, spender: spender, value: amount, });
        }

        fn _increase_allowance(ref self: ContractState, spender: ContractAddress, added_value: u256) -> bool {
            let caller = get_caller_address();
            self._approve(caller, spender, self._allowances.read((caller, spender)) + added_value);
            true
        }

        fn _decrease_allowance(ref self: ContractState, spender: ContractAddress, subtracted_value: u256) -> bool {
            let caller = get_caller_address();
            self._approve(caller, spender, self._allowances.read((caller, spender)) - subtracted_value);
            true
        }

        fn _mint(ref self: ContractState, recipient: ContractAddress, amount: u256) {
            assert(!recipient.is_zero(), 'ERC20: mint to 0');
            self._total_supply.write(self._total_supply.read() + amount);
            self._balances.write(recipient, self._balances.read(recipient) + amount);
            self.emit(Transfer { from: Zeroable::zero(), to: recipient, value: amount });
        }

        fn _burn(ref self: ContractState, account: ContractAddress, amount: u256) {
            assert(!account.is_zero(), 'ERC20: burn from 0');
            self._total_supply.write(self._total_supply.read() - amount);
            self._balances.write(account, self._balances.read(account) - amount);
            self.emit(Transfer { from: account, to: Zeroable::zero(), value: amount });
        }

        fn _assert_owner(ref self: ContractState) {
            assert(self._owner.read() == get_caller_address(), 'Only owner');
        }
    }
}
