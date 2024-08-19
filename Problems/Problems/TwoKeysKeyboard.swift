class TwoKeysKeyboard {
    func minSteps(_ n: Int) -> Int {
        guard n > 1 else { return 0 }
        var result = 0
        var rem = n
        for i in 2...n {
            guard rem != 1 else { break }
            while rem % i == 0 {
                rem /= i
                result += i
            }
        }
        return result
    }
    
    func tests() {
        print(minSteps(15)) // 5 + c-p-p = 8
        print(minSteps(12)) // 5 + c-p = 7
        print(minSteps(10)) // c-p-p-p-p-c-p 7
        print(minSteps(9)) // c-p-p-c-p-p 6
        print(minSteps(8)) // c-p-c-p-p-p 6
        print(minSteps(8)) // c-p-c-p-c-p 6
        print(minSteps(7)) // 7
        print(minSteps(6)) // c-p-p-c-p 5
        print(minSteps(5)) // 5
        print(minSteps(4)) // c-p-p-p // c-p-c-p 4
        print(minSteps(3)) // c-p-p 3
        print(minSteps(2)) // c-p 2
        print(minSteps(1)) // 0
    }
}

