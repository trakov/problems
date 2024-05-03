class CompareVersionNumbers {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let v1 = version1.split(separator: ".").compactMap { Int($0) }
        let v2 = version2.split(separator: ".").compactMap { Int($0) }
        var i = 0
        while i < max(v1.count, v2.count) {
            let num1 = i < v1.count ? v1[i] : 0
            let num2 = i < v2.count ? v2[i] : 0
            let signum = (num1 - num2).signum()
            if signum != 0 { return signum }
            i += 1
        }
        return 0
    }
    
    func tests() {
        print(compareVersion("1.01", "1.001")) // 0
        print(compareVersion("1.0", "1.0.0")) // 0
        print(compareVersion("0.1", "1.1")) // -1
    }
}

