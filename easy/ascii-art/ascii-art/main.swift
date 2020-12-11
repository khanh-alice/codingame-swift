import Foundation

public struct StderrOutputStream: TextOutputStream {
    public mutating func write(_ string: String) {
        fputs(string, stderr)
    }
}

public var errStream = StderrOutputStream()

let ASCII_COUNT = 27
let charWidth = Int(readLine()!)!
let charHeight = Int(readLine()!)!
let inputText = readLine()!.uppercased()

var charMap = [[String]](repeating: [], count: ASCII_COUNT)

if charHeight > 0 {
    for _ in 0..<charHeight {
        let line = readLine()!
        var start = line.startIndex

        for asciiIndex in 0..<ASCII_COUNT {
            let end = line.index(start, offsetBy: charWidth)

            charMap[asciiIndex].append(String(line[start..<end]))
            start = end
        }
    }

    for h in 0..<charHeight {
        var result = ""

        for char in inputText {
            let asciiIndex = Int(char.asciiValue!) - Int(Character("A").asciiValue!)

            result += asciiIndex >= 0 ? charMap[asciiIndex][h] : charMap.last![h]
        }

        print(result)
    }
}
