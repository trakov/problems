class DetermineIfACellIsReachableAtAGivenTime {
    func isReachableAtTime(_ sx: Int, _ sy: Int, _ fx: Int, _ fy: Int, _ t: Int) -> Bool {
        let minTime = max(abs(sx - fx), abs(sy - fy))
        return minTime == 0 ? t != 1 : minTime <= t
    }
    
    func tests() {
        print(isReachableAtTime(2, 4, 7, 7, 6)) // true
        print(isReachableAtTime(3, 1, 7, 3, 3)) // false
        print(isReachableAtTime(1, 2, 1, 2, 1)) // false
        print(isReachableAtTime(1, 2, 1, 2, 0)) // true
    }
}

