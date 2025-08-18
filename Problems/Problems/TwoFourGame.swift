final class TwoFourGame {
    let precision = 1e-3
    let seeked = 24.0
    
    func judgePoint24(_ cards: [Int]) -> Bool {
        func judgePoint24(_ nums: [Double]) -> Bool {
            if nums.count == 1 {
                return nums[0] >= seeked - precision && nums[0] <= seeked + precision
            }
            for i in 0..<nums.count {
                for j in 0..<nums.count where i != j {
                    var next = nums.enumerated()
                        .filter { $0.0 != i && $0.0 != j }
                        .map { $0.1 }
                    let parts = possibleParts(nums[i], nums[j])
                    for p in parts {
                        next.append(p)
                        if judgePoint24(next) {
                            return true
                        }
                        next = next.dropLast()
                    }
                }
            }
            return false
        }
        
        func possibleParts(_ a: Double, _ b: Double) -> [Double] {
            var res = [a + b, a - b, a * b]
            if a != 0 {
                res.append(b / a)
            }
            return res
        }

        return judgePoint24(cards.map { Double($0) })
    }

    func tests() {
        print(judgePoint24([4,1,8,7])) // true
        print(judgePoint24([1,2,1,2])) // false
    }
}
