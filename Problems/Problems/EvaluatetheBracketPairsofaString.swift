final class EvaluatetheBracketPairsofaString {
    func evaluate(_ s: String, _ knowledge: [[String]]) -> String {
        var dict: [String: String] = [:]
        for k in knowledge {
            dict[k[0]] = k[1]
        }
        var addKey = false
        var key = ""
        var result = ""
        for c in s {
            if c == "(" {
                addKey = true
            } else if c == ")" {
                result += dict[key] ?? "?"
                addKey = false
                key.removeAll(keepingCapacity: true)
            } else if addKey {
                key.append(c)
            } else {
                result.append(c)
            }
        }
        return result
    }
    
    func tests() {
        print(evaluate("(name)is(age)yearsold", [["name","bob"],["age","two"]])) // "bobistwoyearsold"
        print(evaluate("hi(name)", [["a","b"]])) // "hi?"
        print(evaluate("(a)(a)(a)aaa", [["a","yes"]])) // "yesyesyesaaa"
    }
}
