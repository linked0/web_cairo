#[starknet::contract]
mod SimpleBalance {
    // TODO: Implement contract with internal functions

    #[storage]
    struct Storage {
        funds: u32,
    }

    #[generate_trait]
    impl InternalImpl of InternalTrait {
        fn _get_funds(self: @ContractState) -> u32 {
            return self.funds.read();
        }
    }

    fn _add_funds(ref self: ContractState, amount: u32) -> u32 {
        let new_funds = self.funds.read() + amount;
        self.funds.write(new_funds);
        return new_funds;
    }
}
