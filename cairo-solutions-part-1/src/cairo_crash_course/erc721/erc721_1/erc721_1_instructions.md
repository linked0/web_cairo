# ERC721 Exercise 1

## Intro

In this exercise you will create your own ERC721 token using the OpenZeppelin ERC721 Cairo Component.
Then, you will add some minting functionality to it, and eventually test it.

## Accounts

- 123 - Deployer & Owner
- 1 - Alice
- 2 - Bob

## Tasks

### Implement the ERC721 contract in `src/exercises/erc721/my_nft.cairo`

1. Create the interface `ERC721Mintable` with one function: `mint()`, which receives a `tokenId` and an `address` to mint the token to.
2. Load all needed modules and components from OpenZeppelin cairo contracts, make sure to load everything needed.
3. In the constructor: Set the owner of the contract, and initialize the ERC721 component with `name` and `symbol` of your choice
4. Implement an internal function to check if the caller is the owner of the contract
5. Implement the `ERC721Mintable` interface with an external `mint()` function, make sure that only the owner can call the `mint()` function.

### Testing in the `src/exercises/erc721/test_erc721.cairo` file

1. Implement a utility `mint_nft()` function that will be used to mint NFTs for users
2. In the `test_mint` block
   1. Mint tokenId 1 to Alice
   2. Make sure that Alice is the owner of the tokenId 1
3. In the test `test_transfer` block
   1. Approve Bob to spend token id 1 on behalf of Alice
   2. Transfer tokenId 1 from Alice to Bob
   3. Check if Bob is the owner of the token id 1
   4. Check the the balance of Alice is 0 and the balance of Bob is 1

## Useful links

[Foundry testing](https://book.starknet.io/ch02-13-foundry-forge.html)

[Openzeppelin docs for ERC721](https://docs.openzeppelin.com/contracts-cairo/0.8.0/erc721)

[Openzeppelin ERC721 implementation in Cairo](https://github.com/OpenZeppelin/cairo-contracts/blob/main/src/token/erc721/erc721.cairo)
