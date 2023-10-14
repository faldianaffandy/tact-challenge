import "@stdlib/deploy";

message(0x44) Refund {
  queryId: Int as uint64;
  sender: Address;
}

contract Task2 with Deployable {
  admin: Address;

  init(admin: Address) {
    self.admin = admin;
  }

  // This function is called when a user sends TONs to this contract.
  receive() {
    // Make sure there are TONs attached to the message.
    assert(msg.value > 0, 101);

    // Record the user's address and the original message in the storage.
    storage[msg.sender] = msg;
    
    // Forward the received TONs to the admin contract.
    send(self.admin, msg.value, msg.data);
  }

  // This function is called when the admin contract decides to refund TONs to a user.
  receive(msg: Refund) {
    // Ensure that the refund message is coming from the admin address.
    require(msg.sender == self.admin, 102);

    // Get the original message from the storage.
    let originalMessage = storage[msg.queryId];

    // Forward the TONs back to the user who initiated the original message.
    send(originalMessage.sender, msg.value, originalMessage.data);

    // Clean up the storage after the refund is processed.
    storage[msg.queryId] = null;
  }
}
