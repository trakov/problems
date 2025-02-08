class DesignaNumberContainerSystem {
    var indexToNumber: [Int: Int] = [:]
    var numberToIndices: [Int: Heap<Int>] = [:]

    func change(_ index: Int, _ number: Int) {
        indexToNumber[index] = number
        numberToIndices[number, default: Heap(sort: <)].insert(index)
    }
    
    func find(_ number: Int) -> Int {
        while let index = numberToIndices[number]?.peek() {
            if indexToNumber[index] == number { return index }
            numberToIndices[number]?.remove()
        }
        return -1
    }

// import HeapModule
//    var indexToNumber: [Int: Int] = [:]
//    var numberToIndices: [Int: Heap<Int>] = [:]
//
//    func change(_ index: Int, _ number: Int) {
//        indexToNumber[index] = number
//        numberToIndices[number, default: Heap()].insert(index)
//    }
//    
//    func find(_ number: Int) -> Int {
//        while let index = numberToIndices[number]?.min {
//            if indexToNumber[index] == number { return index }
//            numberToIndices[number]?.popMin()
//        }
//        return -1
//    }

    func tests() {
        print(find(10)) // -1
        print(change(2, 10))
        print(change(1, 10))
        print(change(3, 10))
        print(change(5, 10))
        print(find(10)) // 1
        print(change(1, 20))
        print(find(10)) // 2
    }
}

