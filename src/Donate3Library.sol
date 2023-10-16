// SPDX-License-Identifier: MIT
pragma solidity >= 0.6.0 < 0.9.0;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library Donate3Library {
    function getBTCPrice() internal view returns (uint256) {
        // Address: 0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
        AggregatorV3Interface btcFeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43);
        (, int256 answer,,,) = btcFeed.latestRoundData();
        return uint256(answer);
    }

    function getBTCDecimal() internal view returns (uint8) {
        return AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43).decimals();
    }

    function btcInUSD(uint256 amount) internal view returns (uint256) {
        uint256 btcPrice = getBTCPrice();
        uint256 btcAmountInUSD = (amount * 1e18 * btcPrice) / (10 ** getBTCDecimal());
        return btcAmountInUSD;
    }

    function getETHPrice() internal view returns (uint256) {
        // Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface ethFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 answer,,,) = ethFeed.latestRoundData();
        return uint256(answer);
    }

    function getETHDecimal() internal view returns (uint8) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).decimals();
    }

    function ethInUSD(uint256 amount) internal view returns (uint256) {
        uint256 ethPrice = getETHPrice();
        uint256 ethAmountInUSD = (amount * 1e18 * ethPrice) / (10 ** getETHDecimal());
        return ethAmountInUSD;
    }

    function getGBPPrice() internal view returns (uint256) {
        // Address: 0x91FAB41F5f3bE955963a986366edAcff1aaeaa83
        AggregatorV3Interface gbpFeed = AggregatorV3Interface(0x91FAB41F5f3bE955963a986366edAcff1aaeaa83);
        (, int256 answer,,,) = gbpFeed.latestRoundData();
        return uint256(answer);
    }

    function getGBPDecimal() internal view returns (uint8) {
        return AggregatorV3Interface(0x91FAB41F5f3bE955963a986366edAcff1aaeaa83).decimals();
    }

    function gbpInUSD(uint256 amount) internal view returns (uint256) {
        uint256 gbpPrice = getGBPPrice();
        uint256 gbpAmountInUSD = (amount * 1e18 * gbpPrice) / (10 ** getGBPDecimal());
        return gbpAmountInUSD;
    }

    function getEURPrice() internal view returns (uint256) {
        // Address: 0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910
        AggregatorV3Interface eurFeed = AggregatorV3Interface(0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910);
        (, int256 answer,,,) = eurFeed.latestRoundData();
        return uint256(answer);
    }

    function getEURDecimal() internal view returns (uint8) {
        return AggregatorV3Interface(0x1a81afB8146aeFfCFc5E50e8479e826E7D55b910).decimals();
    }

    function eurInUSD(uint256 amount) internal view returns (uint256) {
        uint256 eurPrice = getEURPrice();
        uint256 eurAmountInUSD = (amount * 1e18 * eurPrice) / (10 ** getEURDecimal());
        return eurAmountInUSD;
    }
}
