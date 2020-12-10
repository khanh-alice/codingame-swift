// game loop
while true {
    // name of enemy 1
    let enemy1 = readLine()!

    // distance to enemy 1
    let dist1 = Int(readLine()!)!

    // name of enemy 2
    let enemy2 = readLine()!

    // distance to enemy 2
    let dist2 = Int(readLine()!)!

    if dist1 < dist2 {
        print(enemy1)
    } else {
        print(enemy2)
    }
}
