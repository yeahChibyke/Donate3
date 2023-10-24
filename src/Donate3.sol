// SPDX-License-Identifier: MIT
pragma solidity >= 0.6.0 < 0.9.0;

// Donate3 is the future of crowd-donation. Users can donate funds in either ETH, BTC, GBP, EUR, or USD
// Only admin can withdraw funds donated to a particular project.
// This will be updated in a future commit to enable project owners to be able do this directly

import {Donate3Library} from "./Donate3Library.sol";
// added this import because of the getVersion() function I added newly
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

error Donate3__UnAuthorized();

contract Donate3 {
    using Donate3Library for uint256;

    uint256 public constant MIN_DONATION = 100e18;

    // list of donors addresses
    address[] public donors;

    // mapping of address to donation
    mapping(address donor => uint256 amountDonated) public addressToDonation;

    address public immutable i_admin;

    // refactored #1
    AggregatorV3Interface private s_priceFeed;

    constructor(address priceFeed) {
        i_admin = msg.sender;
        s_priceFeed = AggregatorV3Interface(priceFeed);
    }

    function donateBTC() public payable {
        require(msg.value.btcInUSD(s_priceFeed) >= MIN_DONATION, "BTC amount is too low!");
        donors.push(msg.sender);
        addressToDonation[msg.sender] += msg.value;
    }

    /** function donateETH() public payable {
        require(msg.value.ethInUSD(s_priceFeed) >= MIN_DONATION, "ETH amount is too low!");
        donors.push(msg.sender);
        addressToDonation[msg.sender] += msg.value;
    } **/

    /** function donateGBP() public payable {
        require(msg.value.gbpInUSD(s_priceFeed) >= MIN_DONATION, "GBP amount is too low!");
        donors.push(msg.sender);
        addressToDonation[msg.sender] += msg.value;
    } **/

    /** function donateEUR() public payable {
        require(msg.value.eurInUSD(s_priceFeed) >= MIN_DONATION, "EUR amount is too low!");
        donors.push(msg.sender);
        addressToDonation[msg.sender] += msg.value;
    } **/

    function withdraw() public onlyAdmin {
        // the onlyAdmin modifier requires only admin to be able to withdraw
        // Use for loop to reset the addressToDonation mapping down to zero
        // The for loop resets the amount in each address at a particular index to zero, starting from the zero index
        for (uint256 donorIndex = 0; donorIndex < donors.length; donorIndex++) {
            address donor = donors[donorIndex];
            addressToDonation[donor] = 0;
        }
        // To reset the array, we use the 'new' keyword to reset the donors array to a brand new blank address array
        donors = new address[](0);
        // To withdraw the funds proper:
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed!");
    }

    /** function getETHBal() public view onlyAdmin returns (uint256) {
        uint256 ethBal = address(this).balance;
        return ethBal;
    } **/

    /** function getUSDBal() public view onlyAdmin returns (uint256) {
        uint256 ethBal = address(this).balance;
        uint256 ethPrice = Donate3Library.getETHPrice();
        uint256 usdBal = (ethBal * ethPrice) / 1e18;
        return usdBal;
    } **/

    // added this function so I can practice writing tests
    function getVersion() public view returns (uint256) {
        return s_priceFeed.version();
    }

    // added this function so I can practice writing tests
    function getBTCDecimal() public view returns (uint8) {
        return s_priceFeed.decimals();
    }

    // added this function so I can practice writing tests
    /** function getETHDecimal() internal view returns (uint8) {
        return s_priceFeed.decimals();
    } **/

    // added this function so I can practice writing tests
    /** function getGBPDecimal() internal view returns (uint8) {
        return s_priceFeed.decimals();
    } **/

    // added this function so I can practice writing tests
    /** function getEURDecimal() internal view returns (uint8) {
        return s_priceFeed.decimals();
    } **/

    modifier onlyAdmin() {
        // require(msg.sender == i_admin, "Must be Admin!");
        if (msg.sender != i_admin) {
            revert Donate3__UnAuthorized();
        }
        _;
    }

    // What if someone sends this contract money without calling any of the donate functions

    receive() external payable {
        donateBTC();
        /** donateETH();
        donateEUR();
        donateGBP(); **/
    }

    fallback() external payable {
        donateBTC();
        /** donateETH();
        donateEUR();
        donateGBP(); **/
    }
}
