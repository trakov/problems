class ContainsDuplicateIII {
    func containsNearbyAlmostDuplicate(
        _ nums: [Int], _ indexDiff: Int, _ valueDiff: Int
    ) -> Bool {
        guard let minVal = nums.min() else { return false }
        var map: [Int: Int] = [:]
        let n = valueDiff + 1
        for (i, num) in nums.enumerated() {
            let b = (num + minVal)/n
            if map[b] != nil { return true }
            if let val = map[b - 1], abs(val - num) < n { return true }
            if let val = map[b + 1], abs(val - num) < n { return true }
            map[b] = num
            if i >= indexDiff {
                map[(nums[i - indexDiff] + minVal) / n] = nil
            }
        }
        return false
    }

    func containsNearbyAlmostDuplicate2(
        _ nums: [Int], _ indexDiff: Int, _ valueDiff: Int
    ) -> Bool {
        let n = nums.count
        let indices = Array(0..<n).sorted { nums[$0] < nums[$1] }
        for (i, idx1) in indices.enumerated() {
            for j in (i + 1)..<n {
                let idx2 = indices[j]
                if nums[idx2] - nums[idx1] > valueDiff { break }
                if abs(idx2 - idx1) <= indexDiff { return true }
            }
        }
        return false
    }
    
    func tests() {
        print(containsNearbyAlmostDuplicate([1,2,3,1], 3, 0)) // true
        print(containsNearbyAlmostDuplicate([1,5,9,1,5,9], 2, 3)) // false
    }
}

