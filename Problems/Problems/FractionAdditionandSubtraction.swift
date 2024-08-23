class FractionAdditionandSubtraction {
    func findGCD(_ a: Int, _ b: Int) -> Int {
        if a == 0 {
            return b
        } else {
            return findGCD(b % a, a)
        }
    }

    func fractionAddition(_ expression: String) -> String {
        var num = 0
        var denom = 1
        var i = 0
        var expression = Array(expression)
        while i < expression.count {
            var currNum = 0
            var currDenom = 0
            var isNegative = false
            if expression[i] == "-" || expression[i] == "+" {
                if expression[i] == "-" {
                    isNegative = true
                }
                i += 1
            }
            while let val = expression[i].wholeNumberValue {
                currNum = currNum * 10 + val
                i += 1
            }
            if isNegative { currNum *= -1 }
            
            i += 1

            while i < expression.count, let val = expression[i].wholeNumberValue {
                currDenom = currDenom * 10 + val
                i += 1
            }
            num = num * currDenom + currNum * denom
            denom *= currDenom
        }
        let gcd = abs(findGCD(num, denom))
        num /= gcd
        denom /= gcd
        return "\(num)/\(denom)"
    }

    func fractionAddition2(_ expression: String) -> String {
        var ops: [Character] = ["+"]
        var nums: [Int] = []
        var denoms: [Int] = []
        var slashDetected = false
        var num = 0
        for c in expression {
            if let n = c.wholeNumberValue {
                num = num * 10 + n
            } else {
                if num > 0 {
                    if slashDetected {
                        denoms.append(num)
                    } else {
                        nums.append(num)
                    }
                    slashDetected = false
                    num = 0
                }
                if c == "+" || c == "-" {
                    ops.append(c)
                } else if c == "/" {
                    slashDetected = true
                }
            }
        }
        if num > 0 {
            denoms.append(num)
        }
        var product = 5*7*8*9
        for i in 0..<nums.count {
            let mult = product / denoms[i]
            nums[i] *= mult
        }
        var result = 0
        while let num = nums.popLast() {
            let op = ops.removeLast()
            if op == "+" {
                result += num
            } else {
                result -= num
            }
        }
        for mult in [2,3,5,7] {
            while result % mult == 0 && product % mult == 0 {
                result /= mult
                product /= mult
            }
        }
        return "\(result)/\(product)"
    }
    
    func tests() {
        print(fractionAddition("-1/2+1/2")) // "0/1"
        print(fractionAddition("-1/2+1/2+1/3")) // "1/3"
        print(fractionAddition("1/3-1/2")) // "-1/6"
    }
}

