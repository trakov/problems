class ThekthLexicographicalStringofAllHappyStringsofLengthn {
    func getHappyString(_ n: Int, _ k: Int) -> String {
        var countdown = k
        func dfs(_ prefix: String) -> String? {
            if prefix.count == n {
                countdown -= 1
                return countdown == 0 ? prefix : nil
            }
            for c in "abc" where c != prefix.last {
                if let res = dfs(prefix + [c]) { return res }
            }
            return nil
        }
        return dfs("") ?? ""
    }

    func tests() {
        print(getHappyString(1, 3)) // "c"
        print(getHappyString(1, 4)) // ""
        print(getHappyString(3, 9)) // "cab"
    }
}
