import Foundation

public struct StderrOutputStream: TextOutputStream {
    public mutating func write(_ string: String) {
        fputs(string, stderr)
    }
}

public var errStream = StderrOutputStream()

let cardCount = Int(readLine()!)!
var cards: [Int] = []

for i in ((readLine()!).split(separator: " ").map(String.init)) {
    cards.append(Int(i)!)
}

var cost = 0

while cards.count > 1 {
    cards.sort(by: >)

    let newCard = cards.removeLast() + cards.removeLast()

    cards.append(newCard)
    cost += newCard
}

print(cost)
