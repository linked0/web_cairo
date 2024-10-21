# Cairo Web3 Project

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