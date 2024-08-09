class ExclusiveTimeofFunctions {
    // track stack with id and time
    func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
        var stack: [(id: Int, time: Int)] = []
        var result = Array(repeating: 0, count: n)
        for log in logs {
            let components = log.components(separatedBy: ":")
            let id = Int(components[0])!
            let status = components[1]
            let time = Int(components[2])!
            if status == "start" {
                stack.append((id, time))
            } else {
                let last = stack.removeLast()
                let timePassed = time - last.time + 1
                result[last.id] += timePassed
                if let last = stack.last {
                    result[last.id] -= timePassed
                }
            }
        }
        return result
    }

    // track prev time
    func exclusiveTime2(_ n: Int, _ logs: [String]) -> [Int] {
        var stack: [Int] = [] // ids
        var result = Array(repeating: 0, count: n)
        var prevTime = 0
        for log in logs {
            let components = log.components(separatedBy: ":")
            let id = Int(components[0])!
            let status = components[1]
            let time = Int(components[2])!
            if !stack.isEmpty {
                result[stack.last!] += time - prevTime
            }
            prevTime = time
            if status == "start" {
                stack.append(id)
            } else {
                result[stack.removeLast()] += 1
                prevTime += 1
            }
        }
        return result
    }
    
    func tests() {
        print(exclusiveTime(
            2, ["0:start:0","1:start:2","1:end:5","0:end:6"]
        )) // [3,4]
        print(exclusiveTime(
            1, ["0:start:0","0:start:2","0:end:5","0:start:6","0:end:6","0:end:7"]
        )) // [8]
        print(exclusiveTime(
            2, ["0:start:0","0:start:2","0:end:5","1:start:6","1:end:6","0:end:7"]
        )) // [7,1]
    }
}

