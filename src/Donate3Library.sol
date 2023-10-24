// SPDX-License-Identifier: MIT
pragma solidity >= 0.6.0 < 0.9.0;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library Donate3Library {
    function getBTCPrice(AggregatorV3Interface priceFeed) internal view returns (uint256) {
        // Address: 0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
        (, int256 answer,,,) = priceFeed.latestRoundData();
        return uint256(answer);
    }

    function btcInUSD(uint256 amount, AggregatorV3Interface priceFeed) internal view returns (uint256) {
        uint256 btcPrice = getBTCPrice(priceFeed);
        uint256 btcAmountInUSD = (amount * 1e18 * btcPrice) / (10 ** 8);
        return btcAmountInUSD;
    }

    /** function getETHPrice(AggregatorV3Interface priceFeed) internal view returns (uint256) {
        // Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        (, int256 answer,,,) = ethFeed.latestRoundData();
        return uint256(answer);
    } **/

    /** function ethInUSD(uint256 amount, AggregatorV3Interface priceFeed) internal view returns (uint256) {
        uint256 ethPrice = getETHPrice(priceFeed);
        uint256 ethAmountInUSD = (amount * 1e18 * ethPrice) / (10 ** 8);
        return ethAmountInUSD;
    } **/

    /** function getGBPPrice(AggregatorV3Interface priceFeed) internal view returns (uint256) {
        // Address: 0x91FAB41F5f3bE955963a986366edAcff1aaeaa83
        (, int256 answer,,,) = gbpFeed.latestRoundData();
        return uint256(answer);
    } **/

    /** function gbpInUSD(uint256 amount, AggregatorV3Interface priceFeed) internal view returns (uint256) {
        uint256 gbpPrice = getGBPPrice(priceFeed);
        uint256 gbpAmountInUSD = (amount * 1e18 * gbpPrice) / (10 ** 8);
        return gbpAmountInUSD;
    } **/

    /** function getEURPrice(AggregatorV3Interface priceFeed) internal view returns (uint256) {
        // Address: 0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910
        (, int256 answer,,,) = eurFeed.latestRoundData();
        return uint256(answer);
    } **/

    /** function eurInUSD(uint256 amount, AggregatorV3Interface priceFeed) internal view returns (uint256) {
        uint256 eurPrice = getEURPrice(priceFeed);
        uint256 eurAmountInUSD = (amount * 1e18 * eurPrice) / (10 ** 8);
        return eurAmountInUSD;
    } **/
}
