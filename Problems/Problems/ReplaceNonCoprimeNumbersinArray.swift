final class ReplaceNonCoprimeNumbersinArray {
    func replaceNonCoprimes(_ nums: [Int]) -> [Int] {
        func gcd(_ a: Int, _ b: Int) -> Int {
            a == 0 ? b : gcd(b % a, a)
        }
        func lcm(_ a: Int, _ b: Int) -> Int {
            a * b / gcd(a, b)
        }
        var stack: [Int] = []
        for num in nums {
            var num = num
            while !stack.isEmpty {
                guard gcd(stack.last!, num) > 1 else {
                    break
                }
                let last = stack.removeLast()
                num = lcm(last, num)
            }
            stack.append(num)
        }
        return stack
    }
    
    func tests() {
        print(replaceNonCoprimes([6,4,3,2,7,6,2])) // [12,7,6]
        print(replaceNonCoprimes([2,2,1,1,3,3,3])) // [2,1,1,3]))
    }
}
