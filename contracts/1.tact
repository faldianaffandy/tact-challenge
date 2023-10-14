import "@stdlib/deploy";

/*
  TASK 1 - Counter 
  Implement a counter contract that will have 2 opcodes ('Add' / 'Subtract'),
  which adds or subtracts the received number (int32) from the number that is stored in the state (and stores the result back in the state).
  You also need to implement one getter with the name "counter" to get the current number from the state.
*/

message Add {
  queryId: Int as uint64;
  number: Int as uint32;
}

message Subtract {
  queryId: Int as uint64;
  number: Int as uint32;
}

contract Task1 with Deployable {
    pub var counter: Int

    init() {
        self.counter = 0
    }

    // Opcode 'Add' implementation
    pub fun addNumber(_ number: Int) {
        self.counter = self.counter + number
    }

    // Opcode 'Subtract' implementation
    pub fun subtractNumber(_ number: Int) {
        self.counter = self.counter - number
    }

    // Getter for 'counter' value
    pub fun getCounter(): Int {
        return self.counter
    }
}
