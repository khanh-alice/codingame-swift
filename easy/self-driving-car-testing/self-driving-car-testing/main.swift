import Foundation

public struct StderrOutputStream: TextOutputStream {
    public mutating func write(_ string: String) {
        fputs(string, stderr)
    }
}

public var errStream = StderrOutputStream()

public func debug(_ message: Any) {
    print(message, to: &errStream)
}

let patternsCount = Int(readLine()!)!
let input = readLine()!.split(separator: ";")
var carPosition = Int(input[0])!

let commands = input[1..<input.count]
var patterns: [[Character]] = []

for _ in 0..<patternsCount {
    let input = readLine()!.split(separator: ";")
    let repeatCount = Int(input[0])!
    let pattern = String(input[1])

    for _ in 0..<repeatCount {
        patterns.append(Array(pattern))
    }
}

var patternIndex = 0

for command in commands {
    let count = Int(command[command.startIndex..<command.index(before: command.endIndex)])!
    let direction = command.last

    for _ in 0..<count {
        if (direction == "L") {
            carPosition -= 1
        } else if (direction == "R") {
            carPosition += 1
        }

        patterns[patternIndex][carPosition - 1] = "#"
        patternIndex += 1
    }
}

for pattern in patterns {
    print(String(pattern))
}
