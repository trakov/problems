class KthDistinctStringinanArray {
    func kthDistinct(_ arr: [String], _ k: Int) -> String {
        var map: [String: Int] = [:]
        for s in arr {
            map[s, default: 0] += 1
        }
        var i = 0
        for s in arr where map[s] == 1 {
            i += 1
            if i == k {
                return s
            }
        }
        return ""
    }
    
    func tests() {
        print(kthDistinct(["d","b","c","b","c","a"], 2)) // "a"
        print(kthDistinct(["aaa","aa","a"], 1)) // "aaa"
        print(kthDistinct(["a","b","a"], 3)) // ""
    }
}

