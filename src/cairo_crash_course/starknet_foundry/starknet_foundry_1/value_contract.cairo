#[starknet::interface]
pub trait IValueContract<TContractState> {
    fn add_value(ref self: TContractState, value_to_add: u32);
    fn get_value(self: @TContractState) -> u32;
}

#[starknet::contract]
pub mod ValueContract {
    // Contract Storage
    #[storage]
    struct Storage {
        value: u32,
        randomvar1234: u32,
    }

    // External Functions
    #[abi(embed_v0)]
    impl IValueContractImpl of super::IValueContract<ContractState> {
        fn add_value(ref self: ContractState, value_to_add: u32) {
            // Add value in argument `a` to the contract's varialbe `value`
            self.value.write(self.value.read() + value_to_add);
        }
        fn get_value(self: @ContractState) -> u32 {
            // Return the contract's variable `value`
            self.value.read()
        }
    }
}
