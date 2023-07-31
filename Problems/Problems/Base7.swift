class Base7 {
    func convertToBase7(_ num: Int) -> String {
        guard num != 0 else { return "0" }
        var result = ""
        var temp = abs(num)
        
        while temp != 0 {
            result = String(temp % 7) + result
            temp /= 7
        }
        
        return (num.signum() == 1 ? "" : "-") + result
    }

    func stringSolution(_ num: Int) -> String {
        String(num, radix: 7)
    }

    func tests() {
        print(convertToBase7(-8)) // -11
        print(convertToBase7(0)) // 0
        print(convertToBase7(7)) // 10
        print(convertToBase7(9)) // 12
        print(convertToBase7(100)) // 202
        print(convertToBase7(-7)) // -10
    }
}
