class GuessNumberHigherOrLower {
    
//    @return          -1 if num is higher than the picked number
//                     1 if num is lower than the picked number
//                  otherwise return 0
    
    var pick = 6
    
    func guess(_ num: Int) -> Int {
        return num > pick ? -1 : num == pick ? 0 : 1
    }

    func guessNumber(_ n: Int) -> Int {
        var left = 1
        var right = n
        
        while left != right {
            let mid = (left + right) / 2
            switch guess(mid) {
            case -1:
                right = mid-1
            case 1:
                left = mid+1
            default:
                return mid
            }
        }
        
        return left
    }

    func tests() {
        pick = 6
        print(guessNumber(10)) // 6
        
        pick = 1
        print(guessNumber(10)) // 1
        
        pick = 1
        print(guessNumber(1)) // 1
    }
}
