import Foundation

public struct StderrOutputStream: TextOutputStream {
    public mutating func write(_ string: String) {
        fputs(string, stderr)
    }
}

public var errStream = StderrOutputStream()

let lineCount = Int(readLine()!)!
var template: [Character] = []
var choice = 0

for _ in 0..<lineCount {
    template += Array(readLine(strippingNewline: false)!)
}

var email: [Character] = []
var choiceChars: [Character] = []
var openChoice = false
var choiceCount = 0

for i in 0..<template.count {
    if template[i] == "(" {
        openChoice = true
        choiceCount += 1
        continue
    }

    if template[i] == ")" {
        let choices = choiceChars.split(separator: "|", omittingEmptySubsequences: false)

        email.append(contentsOf: choices[(choiceCount - 1) % choices.count])
        openChoice = false
        choiceChars = []
        continue
    }

    if openChoice {
        choiceChars.append(template[i])
    } else {
        email.append(template[i])
    }
}

print(String(email))
