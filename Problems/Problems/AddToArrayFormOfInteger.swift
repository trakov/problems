class AddToArrayFormOfInteger {
    func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
        guard k > 0 else { return num }
        var num = num
        var k = k
        var i = num.count - 1
        var one = 0
        
        while k > 0 || i >= 0 || one == 1 {
            let n = (i >= 0 ? num[i] : 0) + k % 10 + one
            if i >= 0 {
                num[i] = n % 10
            } else {
                num.insert(n % 10, at: 0)
            }
            one = n / 10
            k /= 10
            i -= 1
        }
        
        return num
    }

    func tests() {
        print(addToArrayForm([1,2,0,0], 34)) // [1,2,3,4]
        print(addToArrayForm([2,7,4], 181)) // [4,5,5]
        print(addToArrayForm([2,1,5], 806)) // [1,0,2,1]
        print(addToArrayForm([2,1,5], 9806)) // [1,0,0,2,1]
    }
}
