final class AliceandBobPlayingFlowerGame {
    func flowerGame(_ n: Int, _ m: Int) -> Int {
        m * n / 2
    }
    
    func tests() {
        print(flowerGame(3, 2)) // 3
        print(flowerGame(1, 1)) // 0
    }
}
