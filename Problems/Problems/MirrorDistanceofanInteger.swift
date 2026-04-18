final class MirrorDistanceofanInteger {
    func mirrorDistance(_ n: Int) -> Int {
        var rev = 0
        var m = n
        while m > 0 {
            rev = rev * 10 + m % 10
            m /= 10
        }
        return abs(rev - n)
    }
    
    func tests() {
        print(mirrorDistance(25)) // 27
        print(mirrorDistance(10)) // 9
        print(mirrorDistance(7)) // 0
    }
}
