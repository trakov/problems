final class SmallestUniqueSubarray {
    func check(_ v: [Int], _ m: Int) -> Bool {
        let mod = 1_000_000_007
        func binpow(_ a: Int, _ b: Int) -> Int {
            var ret = 1
            var base = a % mod
            var exp = b
            while exp > 0 {
                if exp & 1 == 1 {
                    ret = (ret * base) % mod
                }
                base = (base * base) % mod
                exp /= 2
            }
            return ret
        }
        func computeHash(_ v: [Int], _ i: Int, _ j: Int, _ base: Int) -> Int {
            var p = 1
            var ret = 0
            for x in i...j {
                ret = (ret + (v[x] * p) % mod) % mod
                p = (p * base) % mod
            }
            return ret
        }
        var mp: [Int: Int] = [:]
        let base = 13
        var x = computeHash(v, 0, m - 1, base)
        let p = binpow(base, m - 1)
        let inv = binpow(base, mod - 2)
        mp[x, default: 0] += 1
        var i = 0
        var j = m
        while j < v.count {
            x = ((x - v[i]) % mod + mod) % mod
            x = (x * inv) % mod
            x = (x + (v[j] * p) % mod) % mod
            mp[x, default: 0] += 1
            i += 1
            j += 1
        }
        return mp.values.contains(1)
    }

    func smallestUniqueSubarray(_ nums: [Int]) -> Int {
        var low = 1
        var high = nums.count
        var ans = nums.count
        while low <= high {
            let mid = low + (high - low) / 2
            if check(nums, mid) {
                ans = mid
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return ans
    }

    func tests() {
        print(smallestUniqueSubarray([3,3,3])) // 3
        print(smallestUniqueSubarray([2,1,2,3,3])) // 1
        print(smallestUniqueSubarray([1,1,2,2,1])) // 2
    }
}
