class MinimumNumberofSwapstoMaketheStringBalanced {
    // stack count
    func minSwaps(_ s: String) -> Int {
        var count = 0
        for c in s {
            if c == "[" {
                count += 1
            } else {
                if count > 0 {
                    count -= 1
                }
            }
        }
        return (count + 1) / 2
    }

    // stack
    func minSwaps1(_ s: String) -> Int {
        var stack: [Character] = []
        var unbalanced = 0
        for c in s {
            if c == "[" {
                stack.append(c)
            } else {
                if !stack.isEmpty {
                    stack.removeLast()
                } else {
                    unbalanced += 1
                }
            }
        }
        return (unbalanced + 1) / 2
    }

    func tests() {
        print(minSwaps("][][")) // 1
        print(minSwaps("]]][[[")) // 2
        print(minSwaps("[]")) // 0
    }
}

