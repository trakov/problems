class NumberOfStudentsUnableToEatLunch {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var one = students.reduce(0, +)
        var zero = students.count - one
        for sandwich in sandwiches {
            if sandwich == 0 {
                guard zero > 0 else { break }
                zero -= 1
            } else {
                guard one > 0 else { break }
                one -= 1
            }
        }
        return one + zero
    }
    
    func tests() {
        print(countStudents([1,1,0,0], [0,1,0,1])) // 0
        print(countStudents([1,1,1,0,0,1], [1,0,0,0,1,1])) // 3
    }
}

