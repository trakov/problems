import HeapModule

final class ZeroArrayTransformationIII {
    func maxRemoval(_ nums: [Int], _ queries: [[Int]]) -> Int {
        let queries = queries.sorted { $0[0] < $1[0] }
        var heap: HeapModule.Heap<Int> = []
        let n = nums.count
        var deltaArray: [Int] = Array(repeating: 0, count: n + 1)
        var operations = 0
        var j = 0
        for i in 0..<n {
            let (num, delta) = (nums[i], deltaArray[i])
            operations += delta
            while j < queries.count && queries[j][0] <= i {
                heap.insert(queries[j][1])
                j += 1
            }
            while operations < num && !heap.isEmpty && heap.max! >= i {
                operations += 1
                deltaArray[heap.removeMax() + 1] -= 1
            }
            if operations < num {
                return -1
            }
        }
        return heap.count
    }
    
    func maxRemoval1(_ nums: [Int], _ queries: [[Int]]) -> Int {
        let sortedQueries = queries.sorted { $0[0] < $1[0]}
        var heap = HeapModule.Heap<Int>()
        var j = 0
        let n = nums.count
        var sumDiff = 0
        var diff = [Int](repeating: 0, count: n + 1)
        for i in 0..<n {
            sumDiff += diff[i]
            while j < queries.count && sortedQueries[j][0] <= i {
                heap.insert(sortedQueries[j][1])
                j += 1
            }
            while sumDiff < nums[i] && !heap.isEmpty && heap.max! >= i  {
                sumDiff += 1
                diff[heap.max! + 1] -= 1
                let _ = heap.popMax()
            }
            guard sumDiff >= nums[i] else {return -1}
        }
        return heap.count
    }

    func tests() {
//        print(maxRemoval([2,0,2], [[0,2],[0,2],[1,1]])) // 1
        print(maxRemoval([1,1,1,1], [[1,3],[0,2],[1,3],[1,2]])) // 2
//        print(maxRemoval([1,2,3,4], [[0,3]])) // -1
    }
}
