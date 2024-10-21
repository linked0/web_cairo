#[starknet::interface]
trait ISimpleMap<TContractState> {
    fn add_token(ref self: TContractState, token_name: felt252);
    fn is_token_in_storage(self: @TContractState, key: felt252) -> bool;
}

#[starknet::contract]
mod SimpleMap {
    use super::ISimpleMap;
    use starknet::storage::{Map, StoragePathEntry};
    use starknet::storage::{StorageMapReadAccess, StorageMapWriteAccess};
    // TODO: Define the storage according to the instructions.
    #[storage]
    struct Storage {
        tokens: Map<felt252, bool>
    }

    #[abi(embed_v0)]
    impl SimpleMapImpl of ISimpleMap<ContractState> {
        // TODO: Implement the function so it will add the coin to the storage
        fn add_token(ref self: ContractState, token_name: felt252) {
            assert(self.tokens.read(token_name) == false, 'Token already exists');
            self.tokens.write(token_name, true);
        }

        // TODO: Implement the function so it will return if the coin is in the storage
        fn is_token_in_storage(self: @ContractState, key: felt252) -> bool {
            return self.tokens.read(key);
        }
    }
}

