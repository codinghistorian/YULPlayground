// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
contract Uint112Experiment {

    uint112 operand0 = 1111;
    uint112 operand1 = 2222;
    uint32 operand2 = 3;

    function experiment() external view returns (uint112 result0, uint112 result1, uint32 result2) {
        result0 = operand0;
        result1 = operand1;
        result2 = operand2;
    }
    
    function test() external returns(uint256, uint256) {
        (bool success, bytes memory data) = address(this).call(
            abi.encodeWithSignature("experiment()")
        );
        require(success, "call failed");
        uint256 reserve0;
        uint256 reserve1;
        assembly {
            let fmp := mload(0x40)
            mstore(fmp, data)
            reserve1 := mload(sub(fmp, 0x40))
            reserve0 := mload(sub(fmp, 0x60))
        }
        return (reserve0, reserve1);
    }
}

 

