#[starknet::interface]
trait ISimpleList<TContractState> {
    fn odd_or_even(ref self: TContractState, number: u32);
    fn get_number_by_index(self: @TContractState, list_name: felt252, index: u32) -> u32;
}

#[starknet::contract]
mod SimpleList {
    use super::ISimpleList;
    #[feature("deprecated-list-trait")]
    use alexandria_storage::list::{ListTrait, List};

    // TODO: Implement the storage of the contract according to the instructions
    #[storage]
    struct Storage {
        odd_numbers_list: List<u32>,
        even_numbers_list: List<u32>,
    }

    #[abi(embed_v0)]
    impl SimpleListImpl of ISimpleList<ContractState> {
        // TODO: Implement the functions so it will append the number to the correct list in storage
        fn odd_or_even(ref self: ContractState, number: u32) {
            let mut even_list = self.even_numbers_list.read();
            let mut odd_list = self.odd_numbers_list.read();

            if number % 2 == 0 {
                let _ = even_list.append(number);
            } else {
                let _ = odd_list.append(number);
            }
        }

        // TODO: Implement the functions so it will return the number at the given index from the correct list in storage
        fn get_number_by_index(self: @ContractState, list_name: felt252, index: u32) -> u32 {
            let selected_list: List<u32> = if list_name == 'even' {
                self.even_numbers_list.read()
            } else {
                self.odd_numbers_list.read()
            };

            assert(!selected_list.is_empty(), 'The list is empty');
            assert(selected_list.len() > index, 'Out of bounds');

            return selected_list[index];
        }
    }
}

