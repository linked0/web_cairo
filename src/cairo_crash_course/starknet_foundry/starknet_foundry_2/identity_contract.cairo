use starknet::ContractAddress;

#[starknet::interface]
pub trait IIdentityContract<TContractState> {
    fn who_is_calling(self: @TContractState) -> ContractAddress;
    fn what_time_is_it(self: @TContractState) -> u64;
}

#[starknet::contract]
pub mod IdentityContract {
    use starknet::{ContractAddress, get_caller_address, get_block_timestamp};

    // Contract Storage
    #[storage]
    struct Storage {}

    // External Functions
    #[abi(embed_v0)]
    impl IIdentityContractImpl of super::IIdentityContract<ContractState> {
        fn who_is_calling(self: @ContractState) -> ContractAddress {
            get_caller_address()
        }

        fn what_time_is_it(self: @ContractState) -> u64 {
            get_block_timestamp()
        }
    }
}
