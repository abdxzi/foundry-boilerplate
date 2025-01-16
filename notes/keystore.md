# Foundry Keystore

# `cast wallet`
[Foundry book:keystore](https://book.getfoundry.sh/reference/cast/cast-wallet-import)  


## import 
```sh
cast wallet import BOB --interactive
cast wallet import ALICE --mnemonic "test test test test test test test test test test test test"
```

## Get Address
```sh
cast wallet address --keystore /home/[user]/.foundry/keystores/defaultKey # file
cast wallet address --account defaultKey # name

# --mnemonic
# --private-key
# --private-keys
```

## List 
```sh
cast wallet list
```

## Create New Mnemonics
```sh
cast wallet new-mnemonic --words 24 --accounts 3
```

## Generate a vanity address
```sh
cast wallet vanity --starts-with dead
cast wallet vanity --ends-with beef
```
cast wallet vanity --starts-with dead --save-path /path/to/save

```sh
cast wallet vanity --starts-with dead --save-path /path/to/save
```


