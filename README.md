![](img/logo.png)

## Donate3 💸

**Donate3 is the future of crowd donation.**

Users can donate using any of the following functions:

-   `donateBTC()`: This function enables users to donate with BTC.
-   `donateETH()`: This function enables users to donate with ETH.
-   `donateGBP()`: This function enables users to donate GBP.
-   `donateEUR()`: This function enables users to donate EUR.

## Library

[Donate3Library](https://github.com/yeahChibyke/Donate3/blob/main/src/Donate3Library.sol)

## Modifier

`onlyAdmin()`: Any function declared with this modifier can only be called by the Admin (owner of the contract).

## Minimum Donation

The `MIN_DONATION` is set to $100.

## Usage

After the contract is deployed, users can interact with it and call any of the donate functions via a frontend interface (which will come in a later update). Users must have a web3 wallet connected with sufficient funds.  

### Key Functions Breakdown

#### `donateBTC()`

```javascript
function donateBTC() public payable {
        require(msg.value.btcInUSD(s_priceFeed) >= MIN_DONATION, "BTC amount is too low!");
        donors.push(msg.sender);
        addressToDonation[msg.sender] += msg.value;
    }
```

#### `donateETH()`

```javascript
function donateETH() public payable {
        require(msg.value.ethInUSD(s_priceFeed) >= MIN_DONATION, "ETH amount is too low!");
        donors.push(msg.sender);
        addressToDonation[msg.sender] += msg.value;
    } 
```

#### `donateGBP()`

```javascript
function donateGBP() public payable {
        require(msg.value.gbpInUSD(s_priceFeed) >= MIN_DONATION, "GBP amount is too low!");
        donors.push(msg.sender);
        addressToDonation[msg.sender] += msg.value;
    }
```

#### `donateEUR()`

```javascript
function donateEUR() public payable {
        require(msg.value.eurInUSD(s_priceFeed) >= MIN_DONATION, "EUR amount is too low!");
        donors.push(msg.sender);
        addressToDonation[msg.sender] += msg.value;
    }
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
