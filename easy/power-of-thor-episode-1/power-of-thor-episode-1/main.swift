import Foundation

public struct StderrOutputStream: TextOutputStream {
    public mutating func write(_ string: String) {
        fputs(string, stderr)
    }
}

public var errStream = StderrOutputStream()

let inputs = (readLine()!).split(separator: " ").map(String.init)

// the X position of the light of power
let lightX = Int(inputs[0])!

// the Y position of the light of power
let lightY = Int(inputs[1])!

// Thor's starting X position
let initialTx = Int(inputs[2])!

// Thor's starting Y position
let initialTy = Int(inputs[3])!

var thorX = initialTx
var thorY = initialTy

// game loop
while true {
    // The remaining amount of turns Thor can move. Do not remove this line.
    _ = Int(readLine()!)!

    var output = ""

    if thorY < lightY {
        output += "S"
        thorY += 1
    } else if thorY > lightY {
        output += "N"
        thorY += 1
    }

    if thorX < lightX {
        output += "E"
        thorX += 1
    } else if thorX > lightX {
        output += "W"
        thorX += 1
    }

    print(output)
}
