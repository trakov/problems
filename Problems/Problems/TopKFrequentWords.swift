class TopKFrequentWords {
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var dict: [String: Int] = [:]
        for word in words {
            dict[word, default: 0] += 1
        }
        let sorted = dict.sorted {
            if $0.value == $1.value {
                return $0.key < $1.key
            } else {
                return $0.value > $1.value
            }
        }
        return sorted[0..<k].map {
            $0.key
        }
    }

    func tests() {
        print(topKFrequent(["i","love","leetcode","i","love","coding"], 2)) // ["i","love"]
        print(topKFrequent(["the","day","is","sunny","the","the","the","sunny","is","is"], 4)) // ["the","is","sunny","day"]
    }
}
