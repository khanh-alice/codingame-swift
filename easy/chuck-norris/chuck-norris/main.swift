import Foundation

public struct StderrOutputStream: TextOutputStream {
    public mutating func write(_ string: String) {
        fputs(string, stderr)
    }
}

public var errStream = StderrOutputStream()

let message = readLine()!

let binaryString = message.reduce(into: "") {
    $0 += String(format: "%07d", Int(String($1.asciiValue!, radix: 2))!)
}

var prevChar: Character?
var count = 0
var encodedString = ""

let binaryBits = Array(binaryString + " ")

for i in 0..<binaryBits.count {
    if i == 0 || binaryBits[i] == prevChar {
        count += 1
    } else {
        encodedString += prevChar == "0" ? "00 " : "0 "
        encodedString += (String(repeating: "0", count: count))
        encodedString += binaryBits[i] != " " ? " " : ""
        count = 1
    }

    prevChar = binaryBits[i]
}

print(encodedString)
