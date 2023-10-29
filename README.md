## Donate3 💸

**Donate3 is the future of crowd donation.**

Users can donate using any of the following functions:

-   `donateBTC()`: This function enables users to donate with BTC.
-   `donateETH()`: This function enables users to donate with ETH.
-   `donateGBP()`: This function enables users to donate GBP.
-   `donateEUR()`: This function enables users to donate EUR.
-   `withdraw()`: This function can only be called by the Admin. In a future update `projectOwner` will also be able to call this function.

## Library

[Donate3Library](https://github.com/yeahChibyke/Donate3/blob/main/src/Donate3Library.sol)

## Modifier

`onlyAdmin()`: Any function declared with this modifier can only be called by the Admin (owner of the contract).

## Usage

After the contract is deployed, users can interact with it and call any of the fund functions via a frontend interface (which will come in a later update). Users must have a web3 wallet connected

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
