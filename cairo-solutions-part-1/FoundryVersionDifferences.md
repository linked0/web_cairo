# Starknet Foundry 0.26.0 Upgrade

## Changes in Caller Impersonations:
- **Old version:**
  - `start_prank(CheatTarget::One(contract_address), user_address)`
  - `stop_prank(CheatTarget::One(contract_address))`
- **New version:**
  - `start_cheat_caller_address(contract_address, user_address)`
  - `stop_cheat_caller_address(contract_address)`

## Changes in Timestamp Warping:
- **Old version:**
  - `start_warp(CheatTarget::One(contract_address), 1000)`
  - `stop_warp(CheatTarget::One(contract_address))`
- **New version:**
  - `start_cheat_block_timestamp(contract_address, 1000)`
  - `stop_cheat_block_timestamp(contract_address)`

## Changes in Block Number Rolling:
- **Old version:**
  - `start_roll(CheatTarget::One(contract_address), 1000)`
  - `stop_roll(CheatTarget::One(contract_address))`
- **New version:**
  - `start_cheat_block_number(contract_address, 1000)`
  - `stop_cheat_block_number(contract_address)`

## Changes in Spying Events:
- **Old imports:**
  - `use snforge_std::{spy_events, SpyOn, EventSpy, EventAssertions}`
- **New imports:**
  - `use snforge_std::{spy_events, EventSpy, EventSpyTrait, EventSpyAssertionsTrait}`
- **spy_events() changes in params:**
  - **Old version:**
    - `let mut spy = spy_events(SpyOn::One(contract_address));`
  - **New version:**
    - `let mut spy = spy_events();`

# Upgrade in Deployment/Declaring at 0.23.0

## Class Declaration:
- **Old version:**
  - `let contract_class = declare('Name')`
- **New version:**
  - `let contract_class = declare("Name").unwrap()`

## Contract Deployment:
- **Old version:**
  - `let address = contract_class.deploy(@data_to_constructor).unwrap()`
- **New version:**
  - `let (address, _) = contract_class.deploy(@data_to_constructor).unwrap()`

# Resources

[Starknet Foundry Book - Cheatcodes](https://foundry-rs.github.io/starknet-foundry/appendix/cheatcodes/)

[Starknet Foundry Book - Event Testing](https://foundry-rs.github.io/starknet-foundry/testing/testing-events.html)
