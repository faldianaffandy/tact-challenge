import "@stdlib/deploy";

message(0x7362d09c) JettonNotification {
    queryId: Int as uint64;
    amount: Int as coins;
    from: Address;
    forwardPayload: Slice as remaining;
}

message(0xf8a7ea5) JettonTransfer {
    queryId: Int as uint64;
    amount: Int as coins;
    destination: Address;
    responseDestination: Address?;
    customPayload: Cell?;
    forwardTonAmount: Int as coins;
    forwardPayload: Slice as remaining;
}

contract Task3 with Deployable {
  owner: Address;
  aAmount: Int;
  bAmount: Int;
  jettonAddressA: Address;
  jettonAddressB: Address;
  decimal: Int;

  init(admin: Address, newJettonAddressA: Address, newJettonAddressB: Address) {
    self.owner = admin;
    self.jettonAddressA = newJettonAddressA;
    self.jettonAddressB = newJettonAddressB;
    self.aAmount = 0;
    self.bAmount = 0;
    self.decimal = 1000000000;
  }

  receive(msg: JettonNotification) {
  } 
  
  // Define the return type as Int
  pub fun price(jetton: Address): Int { 
    // Implement the logic to calculate the price
    if jetton == self.jettonAddressA {
      return self.aAmount * self.decimal / self.bAmount;
    } else if jetton == self.jettonAddressB {
      return self.bAmount * self.decimal / self.aAmount;
    } else {
      panic("Invalid jetton address");
    }
  }
  
  // Define the return type as Int
  pub fun balance(jetton: Address): Int { 
    // Implement the logic to return the balance of the specified jetton
    if jetton == self.jettonAddressA {
      return self.aAmount;
    } else if jetton == self.jettonAddressB {
      return self.bAmount;
    } else {
      panic("Invalid jetton address");
    }
  }
}
