final class AvoidFloodinTheCity {
    func avoidFlood(_ rains: [Int]) -> [Int] {
        var result = Array(repeating: -1, count: rains.count)
        var wat: [Int : [Int]] = [:]
        var flds: [Int] = []
        for (r, nth) in rains.enumerated() {
            if nth == 0 {
                flds.append(r)
            } else {
                if wat[nth] == nil {
                    wat[nth] = [1, r]
                } else {
                    let dry = wat[nth]![1]
                    guard !flds.isEmpty, flds.last! > dry else { return [] }
                    for d in 0..<flds.count where flds[d] > dry {
                        result[flds[d]] = nth
                        flds.remove(at: d)
                        wat[nth]![1] = r
                        break
                    }
                }
            }
        }
        flds.forEach { result[$0] = 1 }
        return result
    }
    
    func tests() {
        print(avoidFlood([1,2,3,4])) // [-1,-1,-1,-1]
        print(avoidFlood([1,2,0,0,2,1])) // [-1,-1,2,1,-1,-1]
        print(avoidFlood([1,2,0,1,2])) // []
    }
}
