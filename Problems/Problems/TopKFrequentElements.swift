class TopKFrequentElements {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var map: [Int: Int] = [:]
        for num in nums {
            map[num, default: 0] += 1
        }
        var buckets = Array(repeating: [Int](), count: nums.count + 1)
        for (num, freq) in map {
            buckets[freq].append(num)
        }
        
        var result = Array(repeating: 0, count: k)
        var j = 0
        for i in (0 ..< buckets.count).reversed() where !buckets[i].isEmpty {
            for num in buckets[i] {
                result[j] = num
                j += 1
            }
            guard j < k else {
                break
            }
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

