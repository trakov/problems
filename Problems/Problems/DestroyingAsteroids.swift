final class DestroyingAsteroids {
    func asteroidsDestroyed(_ mass: Int, _ asteroids: [Int]) -> Bool {
        let asteroids = asteroids.sorted()
        var mass = mass
        for a in asteroids {
            guard mass >= a else { return false }
            mass += a
        }
        return true
    }
    
    func tests() {
        print(asteroidsDestroyed(10, [3,9,19,5,21])) // true
        print(asteroidsDestroyed(5, [4,9,23,4])) // false
    }
}
