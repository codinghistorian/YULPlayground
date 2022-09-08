// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
contract Addition_typeCasting {

    function add(bytes32 operand0, uint256 operand1) external pure returns (bytes32 result){
        bytes32 empty;
            assembly {
                empty := add(operand0, operand1)
            }
        return empty;
    }

    function addressToBytes32(address operand0) external pure returns (bytes32 result) {
        return bytes32(abi.encode(operand0));
    }

    function mul(bytes32 operand0, bytes32 operand1) external pure returns (bytes32 result) {
        bytes32 product;
            assembly {
                product := mul(operand0, operand1)
        }
        return product;
    }

    function checkOverflow(bytes32 operand0, bytes32 operand1) external pure returns (bool good) {
        bytes32 product;
            assembly {
                product := mul(operand0, operand1)
        }
        //we assume, we will never have 1 as operand
        require(product > operand0, "overflow");
        require(product > operand1, "overflow");
        return true;
    }

    function negativeNumber(int128 number) external pure returns (bytes32) {
        return bytes32(abi.encode(number));
    }
}

 
 
