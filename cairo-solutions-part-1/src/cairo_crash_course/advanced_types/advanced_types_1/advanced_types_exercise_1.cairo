// TODO: Implement the skeleton function according to instructions
fn build_dictionary() {
    // TODO: Define a new dictionary
    let mut tokens: Felt252Dict<u64> = Default::default();

    // TODO: Insert the items to the dictionary
    tokens.insert('Dodgecoin', 1150);
    tokens.insert('Bitcoin', 1210);
    tokens.insert('ETH', 1011);
    tokens.insert('Solana', 1710);
    tokens.insert('STRK', 1337);

    // TODO: Access the dictionary and verify that the values are correct (using assert)
    assert!(tokens.get('Dodgecoin') == 1150, "Dogecoin has wrong value");
    assert!(tokens.get('Bitcoin') == 1210, "Bitcoin has wrong value");
    assert!(tokens.get('ETH') == 1011, "ETH has wrong value");
    assert!(tokens.get('Solana') == 1710, "Solana has wrong value");
    assert!(tokens.get('STRK') == 1337, "STRK has wrong value");
}
