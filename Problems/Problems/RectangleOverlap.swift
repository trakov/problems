final class RectangleOverlap {
    func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
        min(rec1[2], rec2[2]) > max(rec1[0], rec2[0]) && // width > 0
        min(rec1[3], rec2[3]) > max(rec1[1], rec2[1])    // height > 0
    }
    
    func tests() {
        print(isRectangleOverlap([0,0,2,2], [1,1,3,3])) // true
        print(isRectangleOverlap([0,0,1,1], [1,0,2,1])) // false
        print(isRectangleOverlap([0,0,1,1], [2,2,3,3])) // false
    }
}
