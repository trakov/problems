class TopKFrequentElements {
    // heap
//    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
//        struct FreqElement: Comparable {
//            let val: Int
//            let freq: Int
//
//            static func < (lhs: FreqElement, rhs: FreqElement) -> Bool {
//                lhs.freq < rhs.freq
//            }
//
//            static func == (lhs: FreqElement, rhs: FreqElement) -> Bool {
//                lhs.freq == rhs.freq
//            }
//        }
//        var freqMap = [Int: Int]()
//        for num in nums {
//            freqMap[num, default: 0] += 1
//        }
//        var freqHeap = Heap<FreqElement>()
//        for (key, value) in freqMap {
//            freqHeap.insert(.init(val: key, freq: value))
//            if freqHeap.count > k {
//                freqHeap.removeMin()
//            }
//        }
//        var res = [Int]()
//        while let element = freqHeap.popMax() {
//            res.append(element.val)
//        }
//        return res
//    }

    // bucket sort
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var map: [Int: Int] = [:] // num: count
        for num in nums {
            map[num, default: 0] += 1
        }
        var bucket = Array(repeating: [Int](), count: nums.count + 1)
        for (num, count) in map {
            bucket[count].append(num)
        }
        var result: [Int] = []
        for buck in bucket.reversed() where buck.count > 0 {
            result += buck
            if result.count == k { break }
        }
        return result
    }
    
    func topKFrequent2(_ nums: [Int], _ k: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for num in nums {
            map[num, default: 0] += 1
        }
        let sorted = map.sorted {
            $0.1 >= $1.1
        }
        return sorted.prefix(k).map { $0.key }
    }
    
    func tests() {
        print(topKFrequent([1,1,1,2,2,3], 2)) // [1,2]
        print(topKFrequent([1,1,1,2,2,3,3,3], 2)) // [1,3]
        print(topKFrequent([1], 1)) // [1]
    }
}

