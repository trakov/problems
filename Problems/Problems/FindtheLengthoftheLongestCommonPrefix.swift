class FindtheLengthoftheLongestCommonPrefix {
    // Trie
    
    class Trie {
        var kids: [Character: Trie] = [:]
    }
    
    func longestCommonPrefix(_ arr1: [Int], _ arr2: [Int]) -> Int {
        let root = Trie()
        for num in arr1 {
            let num = String(num)
            var node = root
            for c in num {
                if node.kids[c] == nil {
                    node.kids[c] = Trie()
                }
                node = node.kids[c]!
            }
        }
        
        var result = 0
        
        for num in arr2 {
            let num = String(num)
            var node = root
            for (i, c) in num.enumerated() {
                guard let next = node.kids[c] else {
                    result = max(result, i)
                    break
                }
                node = next
                result = max(result, i + 1)
            }
        }
        
        return result
    }
    
    // hash table
    func longestCommonPrefix2(_ arr1: [Int], _ arr2: [Int]) -> Int {
        var set1: Set<Int> = []
        for num in arr1 {
            var num = num
            while num > 0 {
                set1.insert(num)
                num /= 10
            }
        }
        
        var result = 0
        
        func digitsCount(_ num: Int) -> Int {
            var num = num
            var count = 0
            while num > 0 {
                num /= 10
                count += 1
            }
            return count
        }
        
        for num in arr2 {
            var num = num
            while num > 0 {
                if set1.contains(num) {
                    result = max(result, digitsCount(num))
                    break
                }
                num /= 10
            }
        }
        
        return result
    }
    
    func tests() {
        print(longestCommonPrefix([1,10,100], [1000])) // 3
        print(longestCommonPrefix([1,2,3], [4,4,4])) // 0
        print(longestCommonPrefix([10,20], [17])) // 1
    }
}

