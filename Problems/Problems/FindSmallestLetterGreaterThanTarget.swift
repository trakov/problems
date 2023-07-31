class FindSmallestLetterGreaterThanTarget {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        if letters[0] > target { return letters[0] }
        if letters.last! <= target { return letters[0] }
        var left = 0
        var right = letters.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if letters[mid] <= target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return letters[left]
    }

    func tests() {
        print(nextGreatestLetter(["c","f","j"], "a")) // c
        print(nextGreatestLetter(["c","f","j"], "c")) // f
        print(nextGreatestLetter(["x","x","y","y"], "z")) // x
    }
}
