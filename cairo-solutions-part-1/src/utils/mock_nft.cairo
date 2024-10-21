use starknet::ContractAddress;

#[starknet::interface]
trait IERC721Mintable<TContractState> {
    fn mint(ref self: TContractState, to: ContractAddress, token_id: u256);
}

#[starknet::contract]
mod NFTMock {
    use openzeppelin::token::erc721::erc721::ERC721Component::InternalTrait;
    use openzeppelin::introspection::src5::SRC5Component;
   use openzeppelin::token::erc721::{ERC721Component, ERC721HooksEmptyImpl};
    use starknet::{ContractAddress, get_caller_address};


    component!(path: ERC721Component, storage: erc721, event: ERC721Event);
    component!(path: SRC5Component, storage: src5, event: SRC5Event);

    // ERC721
    #[abi(embed_v0)]
    impl ERC721MixinImpl = ERC721Component::ERC721MixinImpl<ContractState>; // This component uses function_name notation
    
    impl ERC721InternalImpl = ERC721Component::InternalImpl<ContractState>; // Component with internal functions

    #[storage]
    struct Storage {
        #[substorage(v0)]
        erc721: ERC721Component::Storage,
        #[substorage(v0)]
        src5: SRC5Component::Storage,
        owner: ContractAddress
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        #[flat]
        ERC721Event: ERC721Component::Event,
        #[flat]
        SRC5Event: SRC5Component::Event
    }

    #[constructor]
    fn constructor(ref self: ContractState, owner: ContractAddress) {
        // You are free to choose the name and the symbol of the contract.
        let name = "MyNFT";
        let symbol = "NFT";

        self.owner.write(owner);
        self.erc721.initializer(name, symbol, "");
    }

    #[abi(embed_v0)]
    impl ERC721MintableImpl of super::IERC721Mintable<ContractState> {
        fn mint(ref self: ContractState, to: ContractAddress, token_id: u256) {
            self.assert_owner();
            self.erc721.mint(to, token_id);
        }
    }

    #[generate_trait]
    impl Private of PrivateTrait {
        fn assert_owner(ref self: ContractState) {
            assert(self.owner.read() == get_caller_address(), 'Not an owner');
        }
    }
}
