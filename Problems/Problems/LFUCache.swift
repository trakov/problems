class LFUCache {
    var capacity: Int
    var cache: [Int: (Int, Int)] = [:]
    var freq: [Int: [Int]] = [:]
    var minFreq: Int = 0

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let (value, fr) = cache[key] else { return -1 }
        freq[fr, default: []].removeAll(where: { $0 == key })
        freq[fr + 1, default: []].append(key)
        cache[key] = (value, fr + 1)
        if freq[minFreq]?.isEmpty ?? true {
            minFreq += 1
        }
        return value
    }
    
    func put(_ key: Int, _ value: Int) {
        guard capacity > 0 else { return }
        if let (_, fr) = cache[key] {
            freq[fr, default: []].removeAll(where: { $0 == key })
            freq[fr + 1, default: []].append(key)
            cache[key] = (value, fr + 1)
            if freq[minFreq]?.isEmpty ?? true {
                minFreq += 1
            }
        } else {
            if cache.count == capacity {
                if let key = freq[minFreq]?.first {
                    cache.removeValue(forKey: key)
                    freq[minFreq]?.removeFirst()
                }
            }
            cache[key] = (value, 1)
            freq[1, default: []].append(key)
            minFreq = 1
        }
    }

    func tests() {
        
    }
}
