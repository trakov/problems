class RestoreIPAddresses {
    func restoreIpAddresses(_ s: String) -> [String] {
        guard s.count < 13 else { return [] }
        guard s.count > 3 else { return [] }
        let s = s.map { Int($0.asciiValue!) - 48 }
        var result: [String] = []

        func dfs(_ start: Int, _ list: [Int]) -> Bool {
            guard list.count < 4 || start < s.count else { return list.count == 4 && start == s.count }
            var number = 0, i = start, end = start + min(s.count-start, 3)
            while i < end {
                number = number * 10 + s[i]
                guard number < 256 else { break }
                let newList = list + [number]
                if dfs(i+1, newList) {
                    result.append(newList.map(String.init).joined(separator: "."))
                }
                if number == 0 { break }
                i += 1
            }
            return false
        }

        dfs(0, [])
        return result
    }

    func tests() {
        print(restoreIpAddresses("25525511135")) // ["255.255.11.135","255.255.111.35"]
        print(restoreIpAddresses("0000")) // ["0.0.0.0"]
        print(restoreIpAddresses("101023")) // ["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"]
    }
}
