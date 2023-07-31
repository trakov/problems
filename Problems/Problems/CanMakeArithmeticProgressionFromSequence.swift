class CanMakeArithmeticProgressionFromSequence {
    func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
        guard arr.count > 2 else { return true }
        let minValue = arr.min()!
        let maxValue = arr.max()!
        guard maxValue != minValue else { return true }
        guard (maxValue - minValue) % (arr.count - 1) == 0 else { return false }
        let diff = (maxValue - minValue) / (arr.count - 1)
        var set: Set<Int> = []
        
        for num in arr {
            guard (num - minValue) % diff == 0 else { return false }
            set.insert(num)
        }
        
        return set.count == arr.count
    }

    func canMakeArithmeticProgression2(_ arr: [Int]) -> Bool {
        guard arr.count > 2 else { return true }
        var arr = arr.sorted()
        let diff = arr[1] - arr[0]
        var i = 2
        while i < arr.count {
            if arr[i] - arr[i - 1] != diff {
                return false
            }
            i += 1
        }
        return true
    }

    func tests() {
        print(canMakeArithmeticProgression([3,5,1])) // true
        print(canMakeArithmeticProgression([1,2,4])) // false
    }
}
