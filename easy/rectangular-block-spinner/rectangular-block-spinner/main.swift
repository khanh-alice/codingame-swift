import Foundation

public struct StderrOutputStream: TextOutputStream {
    public mutating func write(_ string: String) {
        fputs(string, stderr)
    }
}

public var errStream = StderrOutputStream()

let size = Int(readLine()!)!
var angle = Int(readLine()!)!
var matrix: [[Character]] = []

for _ in 0..<size {
    let line = readLine()!

    matrix.append(Array(line.components(separatedBy: .whitespaces).joined()))
}

func rotate90(_ input: [[Character]]) -> [[Character]] {
    let n = input.count
    var output: [[Character]] = Array(repeating: Array(repeating: Character(" "), count: n), count: n)

    for i in 0..<input.count {
        for j in 0..<input.count {
            output[-j + n - 1][i] = input[i][j]
        }
    }

    return output
}

func rotate45(_ input: [[Character]]) -> [[Character]] {
    let n = input.count
    let nn = 2 * n - 1
    var output: [[Character]] = Array(repeating: Array(repeating: Character(" "), count: nn), count: nn)

    for i in 0..<input.count {
        for j in 0..<input.count {
            output[i - j + n - 1][i + j] = input[i][j]
        }
    }

    return output
}

angle = angle % 360

for _ in 0..<(angle / 90) {
    matrix = rotate90(matrix)
}

angle %= 90

if angle != 0 {
    matrix = rotate45(matrix)
}

for line in matrix {
    print(String(line))
}
