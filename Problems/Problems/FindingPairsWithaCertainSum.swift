final class FindingPairsWithaCertainSum {
    var numberCount: [Int:Int] = [:]
    var dict2: [Int:Int] = [:]
    var arr1: [Int] = []
    init(_ nums1: [Int], _ nums2: [Int]) {
        arr1 = nums1
        for i in 0..<nums2.count{
            dict2[i, default: 0] = nums2[i]
            numberCount[nums2[i], default: 0] += 1
        }
    }
    
    func add(_ index: Int, _ val: Int) {
        let number = dict2[index]!
        numberCount[number]! -= 1
        if numberCount[number]! == 0 {
            numberCount[number] = nil
        }
        dict2[index]! = number + val
        numberCount[number + val, default: 0] += 1
    }
    
    func count(_ tot: Int) -> Int {
        var c = 0
        for n in arr1 {
            if numberCount[tot - n] == nil {
                continue
            } else {
                c += numberCount[tot - n]!
            }
        }
        return c
    }

    static func tests() {
        let f = FindingPairsWithaCertainSum([1, 1, 2, 2, 2, 3], [1, 4, 5, 2, 5, 4])
        print(f.count(7)) // 8
        print(f.add(3, 2))
        print(f.count(8)) // 2
        print(f.count(4)) // 1
        print(f.add(0, 1))
        print(f.add(1, 1))
        print(f.count(7)) // 11
    }
}
