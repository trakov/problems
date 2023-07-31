class MakeArrayStrictlyIncreasing {
    func makeArrayIncreasing(_ arr1: [Int], _ arr2: [Int]) -> Int {
        var dp: [String: Int] = [:]
        let arr2 = arr2.sorted()
        
        func dfs(_ i: Int, _ prev: Int) -> Int {
            guard i < arr1.count else { return 0 }
            let key = "\(i),\(prev)"
            if let value = dp[key] { return value }
            var cost = 2001
            if arr1[i] > prev {
                cost = dfs(i + 1, arr1[i])
            }
            let idx = binarySearch(prev)
            if idx < arr2.count {
                cost = min(cost, 1 + dfs(i + 1, arr2[idx]))
            }
            dp[key] = cost
            return cost
        }
        
        func binarySearch(_ value: Int) -> Int {
            var l = 0
            var r = arr2.count
            while l < r {
                let mid = (l + r) / 2
                arr2[mid] <= value ? (l = mid + 1) : (r = mid)
            }
            return l
        }

        let result = dfs(0, Int.min)
        return result < 2001 ? result : -1
    }

    func tests() {
        print(makeArrayIncreasing([1,5,3,6,7], [1,3,2,4])) // 1
        print(makeArrayIncreasing([1,5,3,6,7], [4,3,1])) // 2
        print(makeArrayIncreasing([1,5,3,6,7], [1,6,3,3])) // -1
    }
}

