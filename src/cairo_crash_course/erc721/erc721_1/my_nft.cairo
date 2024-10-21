use starknet::ContractAddress;

// TODO: Implement the ERC721Mintable interface
#[starknet::interface]
trait ERC721Mintable<TContractState> {
    fn mint(ref self: TContractState, to: ContractAddress, token_id: u256);
}

// TODO: Implement your NFT-ERC721 contract here.
#[starknet::contract]
mod MyNFT {
    // TODO: Use all the necessary modules
    use openzeppelin::introspection::src5::SRC5Component;
   use openzeppelin::token::erc721::{ERC721Component, ERC721HooksEmptyImpl};
    use starknet::{ContractAddress, get_caller_address};

    // TODO: Load all the necessary ERC721 and SRC5 components
    component!(path: ERC721Component, storage: erc721, event: ERC721Event);
    component!(path: SRC5Component, storage: src5, event: SRC5Event);

    // TODO: Load the ERC721 implementations
    #[abi(embed_v0)]
    impl ERC721MixinImpl = ERC721Component::ERC721MixinImpl<ContractState>;
    
    impl ERC721InternalImpl = ERC721Component::InternalImpl<ContractState>;

    #[storage]
    struct Storage {
        // TODO: Add the needed substorages of the ERC721 and the SRC5 components
        #[substorage(v0)]
        erc721: ERC721Component::Storage,
        #[substorage(v0)]
        src5: SRC5Component::Storage,
        owner: ContractAddress
    }

    // TODO: Add the ERC721 and SRC5 events
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
        // TODO: Initialize the owner of the contract
        self.owner.write(owner);

        // TODO: choose the name and the symbol of the contract, and initialize the ERC721 component
        self.erc721.initializer("My NFT", "mNFT", "");
    }

    // TODO: Implement a minting public function which only the owner of the contract can call
    #[abi(embed_v0)]
    impl ERC721MintableImpl of super::ERC721Mintable<ContractState> {
        fn mint(ref self: ContractState, to: ContractAddress, token_id: u256) {
            self._assert_owner();
            self.erc721.mint(to, token_id);
        }
    }

    // TODO: implement a `Private` trait with an private `_assert_owner` function to check that the caller is the owner
    #[generate_trait]
    impl Private of PrivateTrait {
        fn _assert_owner(self: @ContractState) {
            assert(self.owner.read() == get_caller_address(), 'Not Owner');
        }
    }
}
