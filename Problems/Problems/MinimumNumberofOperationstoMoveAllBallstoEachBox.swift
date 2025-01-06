class MinimumNumberofOperationstoMoveAllBallstoEachBox {
    func minOperations(_ boxes: String) -> [Int] {
        let boxes = Array(boxes)
        let n = boxes.count
        var result = Array(repeating: 0, count: n)
        var leftCount = 0, left = 0
        var rightCount = 0, right = 0
        for (i, box) in boxes.enumerated() {
            result[i] += left
            leftCount += Int(String(box))!
            left += leftCount

            let j = n - 1 - i
            result[j] += right
            rightCount += Int(String(boxes[j]))!
            right += rightCount
        }
        return result
    }

    // brute-force
    func minOperations2(_ boxes: String) -> [Int] {
        let n = boxes.count
        var result = Array(repeating: 0, count: n)
        for (i, box) in boxes.enumerated() where box == "1" {
            for j in 0..<n {
                result[j] += abs(i - j)
            }
        }
        return result
    }
    
    func tests() {
        print(minOperations("110")) // [1,1,3]
        print(minOperations("001011")) // [11,8,5,4,3,4]
    }
}
