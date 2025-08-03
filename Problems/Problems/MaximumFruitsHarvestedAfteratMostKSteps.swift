final class MaximumFruitsHarvestedAfteratMostKSteps {
    func maxTotalFruits(_ fruits: [[Int]], _ startPos: Int, _ k: Int) -> Int {
        var (left, right) = (0, 0)
        let n = fruits.count
        var sum = 0
        var result = 0

        func step(_ left: Int, _ right: Int) -> Int {
            min(abs(startPos - fruits[right][0]), abs(startPos - fruits[left][0]))
            + fruits[right][0]
            - fruits[left][0]
        }

        while right < n {
            sum += fruits[right][1]
            while left <= right && step(left, right) > k {
                sum -= fruits[left][1]
                left += 1
            }
            result = max(result, sum)
            right += 1
        }
        return result
    }

    func tests() {
        print(maxTotalFruits([[2,8],[6,3],[8,6]], 5, 4)) // 9
        print(maxTotalFruits([[0,9],[4,1],[5,7],[6,2],[7,4],[10,9]], 5, 4)) // 14
        print(maxTotalFruits([[0,3],[6,4],[8,5]], 3, 2)) // 0
    }
}
