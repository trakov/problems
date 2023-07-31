class FizzBuzz {
    func fizzBuzz(_ n: Int) -> [String] {
        var result: [String] = []
        for i in 1...n {
            if i % 3 != 0 && i % 5 != 0 {
                result.append(String(i))
            } else {
                var str = ""
                if i % 3 == 0 {
                    str.append("Fizz")
                }
                if i % 5 == 0 {
                    str.append("Buzz")
                }
                result.append(str)
            }
        }
        return result
    }

    func tests() {
        print(fizzBuzz(3)) // ["1","2","Fizz"]
        print(fizzBuzz(5)) // ["1","2","Fizz","4","Buzz"]
        print(fizzBuzz(15)) // ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]
    }
}
