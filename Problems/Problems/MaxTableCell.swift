class MaxTableCell {
func maxArea(h: Int, w: Int, horizontalLinesY: [Int], verticalLinesX: [Int]) -> Int {
    let hArray = horizontalLinesY.sorted() + [h]
    let wArray = verticalLinesX.sorted() + [w]
    
    func maxDiffValue(_ array: [Int]) -> Int {
        var maxDiff = 0
        var prevValue = 0
        for index in 0..<array.count {
            maxDiff = max(maxDiff, array[index] - prevValue)
            prevValue = array[index]
        }
        return maxDiff
    }
    return maxDiffValue(hArray) * maxDiffValue(wArray)
}

    func readDataAndRun() {
let input = readLine()!.split(separator: " ").map { Int($0)! }

let h = input[0]
let w = input[1]

let horizontalLinesY: [Int] = {
    let values = readLine()!.split(separator: " ").map { Int($0)! }
    return Array(values)
}()

let verticalLinesX: [Int] = {
    let values = readLine()!.split(separator: " ").map { Int($0)! }
    return Array(values)
}()

let area = maxArea(h: h, w: w, horizontalLinesY: horizontalLinesY, verticalLinesX: verticalLinesX)
    }

    func tests() {
        print(maxArea(
                h: 5,
                w: 4,
                horizontalLinesY: [1, 2, 4],
                verticalLinesX: [1, 3])) // 4
        print(maxArea(
                h: 5,
                w: 4,
                horizontalLinesY: [3, 2, 1],
                verticalLinesX: [2, 3])) // 4
        print(maxArea(
                h: 1,
                w: 1,
                horizontalLinesY: [0, 1],
                verticalLinesX: []))

    }
}
