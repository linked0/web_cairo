// TODO: Define the IFunctionVisibility interface according to the instructions
#[starknet::interface]
trait IFunctionVisibility<TContractState> {
    fn set_value(ref self: TContractState, message: u32);
    fn read_value(self: @TContractState) -> u32;
}

// TODO: implememnt the FunctionVisibility contract and it's functions according to the instructions
#[starknet::contract]
mod FunctionVisibility {
    #[storage]
    struct Storage {
        value: u32,
    }

    #[generate_trait]
    impl InternalFunctions of InternalFunctionTrait {
        fn _get_value(self: @ContractState) -> u32 {
            return self.value.read();
        }
    }

    #[abi(embed_v0)]
    impl FunctionVisibility of super::IFunctionVisibility<ContractState> {
        fn set_value(ref self: ContractState, message: u32) {
            self.value.write(message);
        }

        fn read_value(self: @ContractState) -> u32 {
            return self._get_value();
        }
    }
}
