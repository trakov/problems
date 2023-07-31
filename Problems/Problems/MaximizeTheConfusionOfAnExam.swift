class MaximizeTheConfusionOfAnExam {
    func maxConsecutiveAnswers(_ answerKey: String, _ k: Int) -> Int {
        guard k < answerKey.count else { return answerKey.count }
        let answerKey = Array(answerKey)
        var t = 0 // count of changing to T
        var f = 0 // count of changing to F
        var result = 1
        var leftT = 0 // when t reaches k+1, leftT+=1
        var leftF = 0 // when f reaches k+1, leftF+=1
        
        for (i, ans) in answerKey.enumerated() {
            if ans == "T" {
                if f == k {
                    while answerKey[leftF] == "F" {
                        leftF += 1
                    }
                    leftF += 1
                } else {
                    f += 1
                }
            } else {
                if t == k {
                    while answerKey[leftT] == "T" {
                        leftT += 1
                    }
                    leftT += 1
                } else {
                    t += 1
                }
            }
            result = max(result, i - leftF + 1, i - leftT + 1)
        }
        
        return result
    }
    
    func tests() {
        print(maxConsecutiveAnswers("TTFF", 2)) // 4
        print(maxConsecutiveAnswers("TFFT", 1)) // 3
        print(maxConsecutiveAnswers("TTFTTFTT", 1)) // 5
    }
}

