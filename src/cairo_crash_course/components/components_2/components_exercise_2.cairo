#[starknet::interface]
pub trait IOperations<TContractState> {
    // TODO: Implement the interface according to instructions
    fn get_value_from_storage(self: @TContractState) -> u32;
    fn increment(ref self: TContractState);
    fn set_to_zero(ref self: TContractState);
    fn simple_addition(ref self: TContractState, x: u32, y: u32) -> u32;
    fn simple_multiplication(self: @TContractState, to_multiply: (u32, u32)) -> u32;
}

#[starknet::component]
pub mod OperationsComponent {
    // TODO: Implement the Storage struct according to instructions
    #[storage]
    struct Storage {
        value: u32,
    }

    // TODO: Implement the external functions according to instructions
    #[embeddable_as(OperationsImpl)]
    impl Operations<TContractState, +HasComponent<TContractState>> of super::IOperations<ComponentState<TContractState>> {
        fn get_value_from_storage(self: @ComponentState<TContractState>) -> u32 {
            return self.value.read();
        }

        fn increment(ref self: ComponentState<TContractState>) {
            self.value.write(self.value.read() + 1);
        }

        fn set_to_zero(ref self: ComponentState<TContractState>) {
            self.value.write(0);
        }

        fn simple_addition(ref self: ComponentState<TContractState>, x: u32, y: u32) -> u32 {
            self.value.write(x + y);
            return x + y;
        }

        fn simple_multiplication(self: @ComponentState<TContractState>, to_multiply: (u32, u32)) -> u32 {
            let (x, y) = to_multiply;
            return x * y;
        }
    }
}
