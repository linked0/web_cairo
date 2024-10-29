# Cairo Web3 Project

## Simple Test
일단 아래 테스트는 이거 하나면 됨.
```
snforge test control_flow_2
```

## Cairo Development
### Cairo Plugin
  - Cairo 1.0 (with r) & Cairo Syntax
  - Solidity Visual Developer: audit tag를 위해서 사용될 수 있음, @audit-ok ⇐ 오딧 관련 코멘트
  - Inline Bookmarks
### Scarb
```
curl --proto '=https' --tlsv1.2 -sSf https://docs.swmansion.com/scarb/install.sh | sh
```

### Sierra
```
curl -L https://raw.githubusercontent.com/software-mansion/universal-sierra-compiler/master/scripts/install.sh | sh
```
### Rust
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
```

### Starknet Foundry
```
curl -L https://raw.githubusercontent.com/foundry-rs/starknet-foundry/master/scripts/install.sh | sh
snfoundryup
snforge --version
```

### Create a project 
```
snforge init <folder_name>
cd <folder_name>
snforge test
snforge test <test_file_name>
```

### Github: create a new repository on the command line
```
echo "# web_cairo" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:linked0/web_cairo.git
git push -u origin main
```

## How setting up account

### Creating an account

#### A Signer
A smart contract that can sign transactions. You should create a keystore file. If you don't have an account, create with this command.

Creating new account
```

sncast --url <rpc url> \
   account add \
   --name account1 \
   --address <address> \
   --private-key <private key> \
   --public-key <public key> \
   --add-profile account1 \
   --type braavos \
```

You can create a keystore file from a private key.
```
starkli signer keystore from-key ~/.starkli-wallets/deployer/keystore.json
```

#### An Account Descriptor
- A json file that contains information about the smart wallet, such as its address and public key.
```
starkli account fetch <address> --output ~/.starkli-wallets/deployer/account.json --rpc <rpc url>
```

## Useful links

[Starknet Foundry writing tests](https://foundry-rs.github.io/starknet-foundry/testing/testing.html)

[Starknet Foundry testing contracts](https://foundry-rs.github.io/starknet-foundry/testing/contracts.html)

[Starkneet Docs](https://docs.starknet.io/)

[Foundry Book: Dive into sncast](https://foundry-rs.github.io/starknet-foundry/starknet/index.html)

[Starknet.js](https://starknetjs.com/docs/guides/intro)

[Setup Starknet Env.](https://docs.starknet.io/quick-start/environment-setup/)


----
## csch-solutions-part-1 README

JohnnyTime's Cario Smart Contract Hacking Course Part 1 Exercises Repository WITH Solutions.

### Prerequisites

- Install [Scarb 2.8.1](https://docs.swmansion.com/scarb/download.html#preview-version)
  - Install [asdf](https://asdf-vm.com/guide/getting-started.html)
  - Add scarb plugin - `asdf plugin add scarb`
  - Install scarb 2.8.1 - `asdf install scarb 2.8.1`
  - Set as a global var version - `asdf global scarb 2.8.1`
- Install [Starknet-Foundry 0.24.0](https://github.com/foundry-rs/starknet-foundry)
  - Run - `curl -L https://raw.githubusercontent.com/foundry-rs/starknet-foundry/master/scripts/install.sh | sh`
  - Install version `0.26.0` | `snfoundryup -v 0.29.0`
- Install [Universal Sierra Compiler](https://github.com/software-mansion/universal-sierra-compiler)
  - Run - `curl -L https://raw.githubusercontent.com/software-mansion/universal-sierra-compiler/master/scripts/install.sh | sh`
  - Version: 2.2.0

### Getting started

- To run all tests, use the command `snforge test`.
- To run a specific test file, use the command `snforge test test_name_num`.

### Repository structure

- All the exercises are located in `src/exercises/`
  - The exercises are divided into 2 categories which exist in 2 separate folders: `cairo_crash_course` and `cairo_hacking`
  - Each exercise chapter is represented by a folder, such as `src/exercises/cairo_hacking/first_cairo_contract`.
  - Within each chapter folder, there are subfolders for individual exercises, labeled with the exercise number, e.g.: `src/exercises/cairo_hacking/first_cairo_contract/first_cairo_contract_1`.
- Every exercise includes a Cairo module file (e.g.: `src/exercises/cairo_hacking/first_cairo_contract/first_cairo_contract1.cairo`), which imports the test file and all associated code.
- Initially, the test file is commented out. When you begin working on the exercise, remember to **uncomment the code in the `.cairo` files in the exercise folder!**
  Test files are named in the format `test_name_num.cairo`.

### How to run exercise and complete the exercise

1. Uncomment all the code in the `.cairo` files in the exercise folder.
2. Complete all the TODOs in both the code and the test file.
3. To confirm whether your exercise is completed, run `snforge test exercise`.
   - For instance: `snforge test first_cairo_contract_1`.
   - It is also possible to run the test just with the name of the folder, for instance: `snforge test first_cairo_contract_1`.
4. If the test passes, then you have completed the exercise.

### Troubleshooting

#### Error E0277

**Error:**
error[E0277]: the trait bound `[CodeMapping]: std::default::Default` is not satisfied

**Solution:**
Update rust by running the command `rustup update`.


## History
### 24.10.21 Mon
- Succeeded in testing for `src/cairo_crash_course/basic_types`
- move `tests` folder to `_tests` because it's old artifacts