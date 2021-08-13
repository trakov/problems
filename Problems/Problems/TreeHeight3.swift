class Vertice3 {
    let value: Int
    var children = [Vertice3]()
    
    init(value: Int) {
        self.value = value
    }
    
    func add(v: Vertice3) {
        children.append(v)
    }
    
    func remove(v: Vertice3) {
        guard let i = children.firstIndex(of: v) else { print("AAAARGGHHH!"); return }
        children.remove(at: i)
    }
}

extension Vertice3: CustomStringConvertible {
    var description: String {
        var childs = self.children.count > 0 ? ": \(self.children)" : ""
        childs = ": \(self.children)"
        return "\(self.value)\(childs)"
    }
}
extension Vertice3: Hashable {
    static func == (lhs: Vertice3, rhs: Vertice3) -> Bool {
        return lhs.value == rhs.value && lhs.children == rhs.children
    }
    var hashValue: Int {
        return value.hashValue ^ children.hashValue
    }
}

final class TreeHeight3 {
    func createFullList(from parentsList: [Int]) -> [Vertice3] {
        let temp = (-1...parentsList.count).map { Vertice3(value: $0) }
        for (index, value) in parentsList.enumerated() {
            guard let v = (temp.first { $0.value == value }) else { fatalError("...") }
            let c = Vertice3(value: index)
            v.add(v: c)
        }
        return temp
    }
    
    func processInput(str: String) {
        let input = str.split(separator: "\n")
        guard let count = Int(input.first ?? ""),
              let valuesStr = input.last else {
            fatalError("Bad input")
        }
        let values = (valuesStr.split(separator: " ").compactMap { Int($0) })
        guard values.count == count else {
            fatalError("Count is incorrect: \(values.count) != \(count)")
        }
        let list = createFullList(from: values)
        print(height(list: list))
    }
    
    func height(list: [Vertice3]) -> Int {
        var tempList = list
        var h = 0
        while tempList.count > 1 {
            print("h: \(h). V: \(tempList)")
            let toRemove = tempList.filter { $0.children.count == 0 }
            tempList = tempList.filter { $0.children.count > 0 }
            for c in tempList {
                c.children = c.children.filter { !toRemove.contains($0) }
            }
            h += 1
        }
        return h
    }
    
    func tests() {
        var str = ""
        var isCountSet = false
        while let line = readLine(strippingNewline: false) {
            str.append(line)
            if isCountSet {
                processInput(str: str)
            }
            isCountSet = true
        }
        //processInput(str: "10\n9 7 5 5 2 9 9 9 2 -1")
        //processInput(str: "5\n4 -1 4 1 1")
        //processInput(str: "5\n-1 0 4 0 3")

        //let list = [9,7,5,5,2,9,9,9,2,-1]
        //let list = [4,-1,4,1,1]
        //let list = [-1,0,4,0,3]

        //let tree = createAdjacencyList(from: list)
        //printTree(v: tree)
        //print("height: ", height(v: tree))
    }
}
