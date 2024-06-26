pragma solidity >=0.4.25 <0.9.0;

contract Shipping {
    enum ShippingStatus { Pending, Shipped, Delivered }
    
    ShippingStatus private status;
    
    event LogNewAlert(string description);
    
    constructor() public {
        status = ShippingStatus.Pending;
    }
    
    function Shipped() public {
        status = ShippingStatus.Shipped;
        emit LogNewAlert("Your package has been shipped");
    }
    
    function Delivered() public {
        status = ShippingStatus.Delivered;
        emit LogNewAlert("Your package has arrived");
    }
    
    function getStatus(ShippingStatus _status) internal pure returns (string memory) {
        if (ShippingStatus.Pending == _status) return "Pending";
        if (ShippingStatus.Shipped == _status) return "Shipped";
        if (ShippingStatus.Delivered == _status) return "Delivered";
    }
    
    function Status() public view returns (string memory) {
        ShippingStatus _status = status;
        return getStatus(_status);
    }
}