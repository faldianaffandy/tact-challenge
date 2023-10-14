import 0x1.Crypto

pub contract Task1 {

    // Define a variable to store the counter
    pub var counter: Int

    // Initialize the counter to 0 in the constructor
    init() {
        self.counter = 0
    }

    // Implement the 'Add' operation to increase the counter
    pub fun add(number: Int) {
        pre {
            number > 0: "Number must be positive"
        }
        self.counter = self.counter + number
    }

    // Implement the 'Subtract' operation to decrease the counter
    pub fun subtract(number: Int) {
        pre {
            number > 0: "Number must be positive"
        }
        self.counter = self.counter - number
    }

    // Implement a getter to retrieve the current counter value
    pub fun getCounter(): Int {
        return self.counter
    }
}
