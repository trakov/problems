class CountNumberofTeams {
//    Binary Indexed Tree (Fenwick Tree)
    func numTeams(_ rating: [Int]) -> Int {
        let maxRating = rating.max()!
        // Initialize Binary Indexed Trees for left and right sides
        var leftBIT = Array(repeating: 0, count: maxRating + 1)
        var rightBIT = Array(repeating: 0, count: maxRating + 1)
        // Populate the right BIT with all ratings initially
        for r in rating {
            updateBIT(&rightBIT, r, 1)
        }
        var result = 0
        for r in rating {
            updateBIT(&rightBIT, r, -1)
            // Count soldiers with smaller and larger ratings on both sides
            let smallerRatingsLeft = getPrefixSum(leftBIT, r - 1)
            let smallerRatingsRight = getPrefixSum(rightBIT, r - 1);
            let largerRatingsLeft =
                getPrefixSum(leftBIT, maxRating) -
                getPrefixSum(leftBIT, r)
            let largerRatingsRight =
                getPrefixSum(rightBIT, maxRating) -
                getPrefixSum(rightBIT, r)
            // Count increasing and decreasing sequences
            result += (smallerRatingsLeft * largerRatingsRight)
            result += (largerRatingsLeft * smallerRatingsRight)
            // Add current rating to left BIT
            updateBIT(&leftBIT, r, 1)
        }
        return result
    }
    // Update the Binary Indexed Tree
    private func updateBIT(_ bit: inout [Int], _ index: Int, _ value: Int) {
        var index = index
        while index < bit.count {
            bit[index] += value
            index += index & (-index) // Move to the next relevant index in BIT
        }
    }

    // Get the sum of all elements up to the given index in the BIT
    private func getPrefixSum(_ bit: [Int], _ index: Int) -> Int {
        var sum = 0
        var index = index
        while index > 0 {
            sum += bit[index]
            index -= index & (-index) // Move to the parent node in BIT
        }
        return sum
    }
    
    // DP optimized
    func numTeams1(_ rating: [Int]) -> Int {
        let n = rating.count
        var result = 0
        for mid in 1..<n-1 {
            var leftSmaller = 0
            var rightLarger = 0
            for left in 0..<mid {
                if rating[left] < rating[mid] {
                    leftSmaller += 1
                }
            }
            for right in mid+1..<n {
                if rating[right] > rating[mid] {
                    rightLarger += 1
                }
            }
            result += leftSmaller * rightLarger
            let leftLarger = mid - leftSmaller
            let rightSmaller = n - mid - 1 - rightLarger
            result += leftLarger * rightSmaller
        }
        return result
    }

    // brute force
    func numTeams2(_ rating: [Int]) -> Int {
        let n = rating.count
        var result = 0
        for i in 0..<n-2 {
            for j in i+1..<n-1 {
                let isInc = rating[j] > rating[i]
                for k in j+1..<n where isInc == (rating[k] > rating[j]) {
                    result += 1
                }
            }
        }
        return result
    }
    
    func tests() {
        print(numTeams([2,5,3,4,1])) // 3
        print(numTeams([2,1,3])) // 0
        print(numTeams([1,2,3,4])) // 4
    }
}

