class FirstBadVersion {
    func isBadVersion(_ version: Int) -> Bool {
        return version >= 4
    }
    
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n
        while left <= right {
            if left == right { return left }
            let version = (right + left) / 2
            if isBadVersion(version) {
                right = version
            } else if version == left {
                return right
            } else {
                left = version
            }
        }
        return right
    }

    func tests() {
        print(firstBadVersion(5))
    }
}
