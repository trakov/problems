class MinimumNumberofRemovalstoMakeMountainArray {
    func minimumMountainRemovals(_ nums: [Int]) -> Int {
        let n = nums.count
        
        func lisLength(_ v: [Int]) -> [Int] {
            var lis = [v[0]]
            var lisLen = Array(repeating: 1, count: v.count)
            for i in 1..<v.count {
                if v[i] > lis.last! {
                    lis.append(v[i])
                } else {
                    let index = lis.firstIndex { $0 >= v[i] } ?? 0
                    lis[index] = v[i]
                }
                lisLen[i] = lis.count
            }
            return lisLen
        }
        
        let lis = lisLength(nums)
        
        let reversedNums = Array(nums.reversed())
        var lds = lisLength(reversedNums)
        lds.reverse()
        
        var removals = Int.max
        
        for i in 0..<n {
            if lis[i] > 1 && lds[i] > 1 {
                removals = min(removals, n + 1 - lis[i] - lds[i])
            }
        }
        
        return removals
    }

    func tests() {
        print(minimumMountainRemovals([1,3,1])) // 0
        print(minimumMountainRemovals([2,1,1,5,6,2,3,1])) // 3
    }
}

