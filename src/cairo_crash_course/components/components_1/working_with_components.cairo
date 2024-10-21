#[starknet::interface]
pub trait IWorkingWithComponents<TContractState> {
    fn get_value(self: @TContractState) -> u32;
    fn update_value(ref self: TContractState, new_value: u32);
}

#[starknet::contract]
mod WorkingWithComponents {
    use openzeppelin::access::ownable::ownable::OwnableComponent::InternalTrait;
    use starknet::{ContractAddress};

    // TODO: Import the Ownable component (using the `use` keyword)
    use openzeppelin::access::ownable::OwnableComponent;

    // TODO: Integrate the Ownable component (using `component!` macro)
    component!(path: OwnableComponent, storage: ownable, event: OwnableEvent);


    #[storage]
    struct Storage {
        value: u32,
        // TODO: Integrate the Ownable Component storage
        #[substorage(v0)]
        ownable: OwnableComponent::Storage
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        // TODO: Integrate the Ownable Component events
        #[flat]
        OwnableEvent: OwnableComponent::Event
    }

    // TODO: Integrate the Ownable Component implementations (External and Internal)
    #[abi(embed_v0)]
    impl OwnableImpl = OwnableComponent::OwnableImpl<ContractState>;
    impl InternalImpl = OwnableComponent::InternalImpl<ContractState>;

    // TODO: Implement the constructor that receives an owner and initializes the Ownable component
    // TODO: Set the initial value to 100
    #[constructor]
    fn constructor(ref self: ContractState, owner: ContractAddress) {
        self.ownable.initializer(owner);
        self.value.write(100);
    }

    #[abi(embed_v0)]
    impl IWorkingWithComponentsImpl of super::IWorkingWithComponents<ContractState> {
        // TODO: Implement a view function to reteive the value
        fn get_value(self: @ContractState) -> u32 {
            self.value.read()
        }

        // TODO: Implement an external function to update the value (accessible only by the owner)
        fn update_value(ref self: ContractState, new_value: u32) {
            self.ownable.assert_only_owner();
            self.value.write(new_value);
        }
    }
}

