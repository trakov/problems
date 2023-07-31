class WildcardMatching {
    func isMatch(_ s: String, _ p: String) -> Bool {
        return false
    }
    
    func tests() {
        print(isMatch("aa", "a")) // false
        print(isMatch("aa", "*")) // true
        print(isMatch("cb", "?a")) // false
    }
}

