// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test,console} from "forge-std/Test.sol";
import {Script} from "forge-std/Script.sol";
import {MockAggregatorV3} from "../mocks/MockAggregatorV3.sol";

/**
 *  @notice We will dispense with creating a separate deploy script for 
 *          MockAggregatorV3 and just deploy it direct in the test contract 
 *          setUp() function.
 */
contract MockAggregatorV3Test is Test, Script {
    MockAggregatorV3 public mock;
    string private constant ENV_LABEL_TO_READ = "CHAINLINK_DATAFEED_ANSWER_ETH_USD";

    function setUp() external {
        mock = new MockAggregatorV3(ENV_LABEL_TO_READ);
    }

    ////////////////////////////////////////////////////////////////////
    // Unit tests for constructor()
    ////////////////////////////////////////////////////////////////////
    function testEnvLabelToRead() external view {
        assert(vm.envInt(mock.s_envLabelToRead()) == int256(3000*1e8));
    }

    ////////////////////////////////////////////////////////////////////
    // Unit tests for decimals()
    ////////////////////////////////////////////////////////////////////
    function testDecimals() external view {
        assert(mock.decimals() == uint8(8));
    }

    ////////////////////////////////////////////////////////////////////
    // Unit tests for description()
    ////////////////////////////////////////////////////////////////////
    function testDescription() external view {
        string memory envReadDesc = mock.description();
        string memory testString = "MockAggregatorV3";
        assert(keccak256(bytes(envReadDesc)) == keccak256(bytes(testString)));
    }

    ////////////////////////////////////////////////////////////////////
    // Unit tests for version()
    ////////////////////////////////////////////////////////////////////
    function testVersion() external view {
        assert(mock.version() == uint256(3));
    }
}