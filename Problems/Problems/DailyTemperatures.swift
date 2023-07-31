class DailyTemperatures {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack: [Int] = [] // indices
        var result = Array(repeating: 0, count: temperatures.count)
        
        for (i, t) in temperatures.enumerated().reversed() {
            while !stack.isEmpty && t >= temperatures[stack.last!] {
                stack.removeLast()
            }
            if let lastIndex = stack.last {
                result[i] = lastIndex - i
            } else {
                result[i] = 0
            }
            stack.append(i)
        }
        
        return result
    }
    
    func dailyTemperatures2(_ temperatures: [Int]) -> [Int] {
        var res = Array(repeating: 0, count: temperatures.count)
        var i = res.count - 2
        while i >= 0 {
            var period = 0
            for j in i+1..<res.count {
                period += 1
                if temperatures[j] > temperatures[i] {
                    break
                } else {
                    if res[j] == 0 {
                        period = 0
                        break
                    }
                    if temperatures[j] == temperatures[i] {
                        period += res[j]
                        break
                    }
                }
            }
            res[i] = period
            i -= 1
        }
        return res
    }

    func tests() {
        print(dailyTemperatures([89,62,70,58,47,47,46,76,100,70])) // [8,1,5,4,3,2,1,1,0,0]
        print(dailyTemperatures([73,74,75,71,69,72,76,73])) // [1,1,4,2,1,1,0,0]
        print(dailyTemperatures([30,40,50,60])) // [1,1,1,0]
        print(dailyTemperatures([30,60,90])) // [1,1,0]
    }
}
