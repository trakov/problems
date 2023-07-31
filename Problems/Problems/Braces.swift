import Foundation

let examples = [
    "([](){([])})",
    "()[]}",
    "{{[()]]",
    "()[]([])",
    "((([]()[()])))[]",
    "][][]",
    "[([)]]",
    "foo()",
    "buzz[",
    "()bar()]",
    "(((((((((())))",
    "([](){([])})"
]

struct Stack {
    private var array = [(Int, Character)]()
    
    mutating func push(_ el: (Int, Character)) {
        array.append(el)
    }
    
    mutating func pop() -> (Int, Character)? {
        return array.popLast()
    }
    
    func peek() -> (Int, Character)? {
        return array.last
    }
    
    func isEmpty() -> Bool {
        return peek() == nil
    }
}

let OPENED = "[({"
let CLOSED = "])}"

extension Character {
    func closedBraceIndex() -> String.Index? {
        return CLOSED.firstIndex(of: self)
    }
    
    func isOpenedBrace() -> Bool {
        return OPENED.contains(self)
    }

    func isSameOpenedBrace(as el: Character) -> Bool {
        guard let index = el.closedBraceIndex() else {
            return false
        }
        return OPENED[index] == self
    }
}

//func printWrongIndexOrSuccess(str: String) {
//    var index = -1
//    var wrongIndex: Int?
//    
//    var stack = Stack()
//    
//    for el in str.enumerated() {
//        index += 1
//        if el.element.closedBraceIndex() != nil {
//            if let last = stack.peek(), last.1.isSameOpenedBrace(as: el.element) {
//                stack.pop()
//            } else {
//                wrongIndex = index
//                break
//            }
//        } else if el.element.isOpenedBrace() {
//            stack.push(el)
//        }
//    }
//    
//    let result: String
//    if let wrongIndex = wrongIndex {
//        result = "\(wrongIndex + 1)"
//    } else if stack.isEmpty() {
//        result = "Success"
//    } else {
//        result = "\(stack.peek()!.0 + 1)"
//    }
//    print(result)
//}


//for str in examples {
//    printWrongIndexOrSuccess(str: str)
//}

