class AsteroidCollision {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack: [Int] = []
        
        for asteroid in asteroids {
            if stack.isEmpty || stack.last!.signum() == asteroid.signum() || asteroid > 0 {
                stack.append(asteroid)
            } else {
                while !stack.isEmpty &&
                        stack.last!.signum() != asteroid.signum() &&
                        stack.last! < -asteroid {
                    stack.removeLast()
                }
                if stack.isEmpty || stack.last!.signum() == asteroid.signum() {
                    stack.append(asteroid)
                } else if stack.last! == -asteroid {
                    stack.removeLast()
                }
            }
        }
        
        return stack
    }

    func tests() {
        print(asteroidCollision([-2,-2,1,-2])) // [-2,-2,-2]
        print(asteroidCollision([-2,-1,1,2])) // [-2,-1,1,2]
        print(asteroidCollision([5,10,-5])) // [5,10]
        print(asteroidCollision([8,-8])) // []
        print(asteroidCollision([10,2,-5])) // [10]
    }
}
