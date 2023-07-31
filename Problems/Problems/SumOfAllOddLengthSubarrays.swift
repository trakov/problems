class SumOfAllOddLengthSubarrays {
    func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        var k = 1 // odd count of subarray
        var sum = 0
        
        while k <= arr.count {
            for i in 0..<arr.count + 1 - k {
                for j in i..<k+i {
                    sum += arr[j]
                }
            }
            k += 2
        }
        
        return sum
    }

    func tests() {
        print(sumOddLengthSubarrays([1,4,2,5,3])) // 58
        print(sumOddLengthSubarrays([1,2])) // 3
        print(sumOddLengthSubarrays([10,11,12])) // 66
    }
}
