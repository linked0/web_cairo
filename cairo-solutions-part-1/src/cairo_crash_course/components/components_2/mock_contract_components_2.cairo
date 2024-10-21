#[starknet::contract]
mod ComponentsMockContract {
    // TODO: Implement the Mock contract and integrate the Component
    use cairo_course_exercises::cairo_crash_course::components::components_2::components_exercise_2::{
        IOperations, OperationsComponent
    };

    component!(path: OperationsComponent, storage: Operations, event: OperationsEvent);

    #[storage]
    struct Storage {
        #[substorage(v0)]
        Operations: OperationsComponent::Storage,
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        #[flat]
        OperationsEvent: OperationsComponent::Event
    }

    #[abi(embed_v0)]
    impl OperationsImpl = OperationsComponent::OperationsImpl<ContractState>;
}

