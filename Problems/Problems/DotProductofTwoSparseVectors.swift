class DotProductofTwoSparseVectors {
    class SparseVector {
        var pairs: [(Int, Int)] = []
        init(_ nums: [Int]) {
            for (i, num) in nums.enumerated() where num != 0 {
                pairs.append((i, num))
            }
        }
        
        func dotProduct(_ vec: SparseVector) -> Int {
            var product = 0
            var p = 0
            var q = 0
            while p < pairs.count && q < vec.pairs.count {
                let (i, n1) = pairs[p]
                let (j, n2) = vec.pairs[q]
                if i < j {
                    p += 1
                } else if i > j {
                    q += 1
                } else {
                    product += n1 * n2
                    p += 1
                    q += 1
                }
            }
            return product
        }
    }
    
    class SparseVector2 {
        var map: [Int: Int] = [:]
        init(_ nums: [Int]) {
            for (i, num) in nums.enumerated() where num != 0 {
                map[i] = num
            }
        }
        
        func dotProduct(_ vec: SparseVector2) -> Int {
            if vec.map.count < map.count { return vec.dotProduct(self) }
            var product = 0
            for (i, num) in map {
                product += num * (vec.map[i] ?? 0)
            }
            return product
        }
    }
    
    func tests() {
        var nums1 = [1,0,0,2,3], nums2 = [0,3,0,4,0]
        print(SparseVector(nums1).dotProduct(SparseVector(nums2))) // 8
        print(SparseVector2(nums1).dotProduct(SparseVector2(nums2))) // 8

        nums1 = [0,1,0,0,0]; nums2 = [0,0,0,0,2]
        print(SparseVector(nums1).dotProduct(SparseVector(nums2))) // 0
        print(SparseVector2(nums1).dotProduct(SparseVector2(nums2))) // 0
        
        nums1 = [0,1,0,0,2,0,0]; nums2 = [1,0,0,0,3,0,4]
        print(SparseVector(nums1).dotProduct(SparseVector(nums2))) // 6
        print(SparseVector2(nums1).dotProduct(SparseVector2(nums2))) // 6
    }
}

