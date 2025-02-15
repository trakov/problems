class FindthePunishmentNumberofanInteger {
    func punishmentNumber(_ n: Int) -> Int {
        func canPartition(_ num: Int, _ target: Int) -> Bool {
            if target < 0 || num < target {
                return false
            }
            if num == target {
                return true
            }
            return (
                canPartition(num / 10, target - (num % 10)) ||
                canPartition(num / 100, target - (num % 100)) ||
                canPartition(num / 1000, target - (num % 1000))
            )
        }
        var result = 0
        for num in 1...n {
            let square = num * num
            if canPartition(square, num) {
                result += square
            }
        }
        return result
    }
    
    func tests() {
        print(punishmentNumber(10)) // 182
        print(punishmentNumber(37)) // 1478
    }
}

