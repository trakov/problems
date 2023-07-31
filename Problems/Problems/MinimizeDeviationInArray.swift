class MinimizeDeviationInArray {
    func minimumDeviation(_ nums: [Int]) -> Int {
        var res = Int.max
        var lowest = Int.max
        var arr: [Int] = nums.map {
            let num = $0 % 2 == 0 ? $0 : $0 * 2
            lowest = min(lowest, num)
            return num
        }.sorted(by: >)
        
        while arr[0] % 2 == 0 {
            for i in 0..<arr.count {
                if arr[i] % 2 != 0 || arr[i] < arr[0] {
                    break;
                }
                res = min(res, arr[i] - lowest)
                lowest = min(lowest, arr[i] / 2)
                arr[i] /= 2
            }
            arr.sort(by: >)
        }
        return min(res, arr[0] - lowest)
    }

    func tests() {
        print(minimumDeviation([1,2,3,4])) // 1
        print(minimumDeviation([4,1,5,20,3])) // 3
        print(minimumDeviation([2,10,8])) // 3
    }
}
