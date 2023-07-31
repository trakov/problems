import CoreFoundation
typealias Tuple = (Int, Int)
class SingleThreadedCPU {
    
    func getOrder(_ tasks: [[Int]]) -> [Int] {
        let c = tasks.count, indexes = Array(0..<c).sorted(by: { tasks[$0][0] < tasks[$1][0] || tasks[$0][0] == tasks[$1][0] && $0 < $1 })
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { (a, b, _) in
            let x: Tuple = a!.load(as: Tuple.self), y: Tuple = b!.load(as: Tuple.self)
            let n = x.0 == y.0 ? (x.1 == y.1 ? 0 : (x.1 > y.1 ? 1 : -1)) : (x.0 > y.0 ? 1 : -1)
            return CFComparisonResult(rawValue: n)!
        }
        var heap = CFBinaryHeapCreate(nil, 0, &callbacks, nil), pointer = UnsafeMutablePointer<Tuple>.allocate(capacity: 1), time = 0, result = [Int](), i = 0
        while i < c || CFBinaryHeapGetCount(heap) > 0 {
            if i < c && CFBinaryHeapGetCount(heap) == 0 { // idle time
                time = max(time, tasks[indexes[i]][0])
            }
            while i < c && tasks[indexes[i]][0] <= time { // enqueue tasks
                pointer = UnsafeMutablePointer<Tuple>.allocate(capacity: 1)
                pointer.initialize(to: (tasks[indexes[i]][1], indexes[i]))
                CFBinaryHeapAddValue(heap, pointer)
                i += 1
            }
            if CFBinaryHeapGetCount(heap) > 0 { // process tasks
                let tuple: Tuple = CFBinaryHeapGetMinimum(heap).load(as: Tuple.self)
                CFBinaryHeapRemoveMinimumValue(heap)
                time += tuple.0
                result.append(tuple.1)
            }
        }
        pointer.deinitialize(count: 1)
        pointer.deallocate()
        return result
    }
    
    func getOrder2(_ tasks: [[Int]]) -> [Int] {
        guard tasks.count > 1 else { return [0] }
        var result = Array(repeating: 0, count: tasks.count)
//        var tasks = tasks.sorted { <#[Int]#>, <#[Int]#> in
//            <#code#>
//        }
        var queue: [[Int]] = []
        var i = 0
        while i < result.count {
            
            
            
        }
        
//        temp.sort { t1, t2 in
//            if t1[0] < t2[0] {
//                return true
//            } else if t1[0] > t2[0] {
//                return false
//            }
//            if t1[1] < t2[1] {
//                return true
//            } else if t1[1] > t2[1] {
//                return false
//            }
//            return t1[2] <= t2[2]
//        }
        
        return result
    }
    
    func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        
        return merge(leftArray, rightArray)
    }
    
    func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
        var leftIndex = 0
        var rightIndex = 0
        
        var orderedArray: [T] = []
        
        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            
            if leftElement < rightElement {
                orderedArray.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                orderedArray.append(rightElement)
                rightIndex += 1
            } else {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIndex += 1
            }
        }
        
        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < right.count {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
        
        return orderedArray
    }

    func tests() {
        print(getOrder([[1,2],[2,4],[3,2],[4,1]])) // [0,2,3,1]
        print(getOrder([[7,10],[7,12],[7,5],[7,4],[7,2]])) // [4,3,2,0,1]
    }
}
