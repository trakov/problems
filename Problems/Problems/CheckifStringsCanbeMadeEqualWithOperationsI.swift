final class CheckifStringsCanbeMadeEqualWithOperationsI {
    func canBeEqual(_ s1: String, _ s2: String) -> Bool {
        let (s1, s2) = (Array(s1), Array(s2))
        return Set([s1[0], s1[2]]) == Set([s2[0], s2[2]]) &&
        Set([s1[1], s1[3]]) == Set([s2[1], s2[3]])
    }
    
    func tests() {
        print(canBeEqual("abcd", "cdab")) // true
        print(canBeEqual("abcd", "dacb")) // false
    }
}
