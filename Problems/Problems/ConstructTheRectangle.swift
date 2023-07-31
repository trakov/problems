class ConstructTheRectangle {
    func constructRectangle(_ area: Int) -> [Int] {
        var a = Int(Double(area).squareRoot())
        while a > 0 {
            if area % a == 0 {
                return [area / a, a]
            } else {
                a -= 1
            }
        }
        return []
    }

    func tests() {
        print(constructRectangle(2)) // [2,1]
        print(constructRectangle(4)) // [2,2]
        print(constructRectangle(37)) // [37,1]
        print(constructRectangle(122122)) // [427,286]
    }
}
