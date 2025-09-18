import HeapModule

final class DesignTaskManager {
    class TaskManager {
        struct Task: Comparable {
            static func < (lhs: Task, rhs: Task) -> Bool {
                lhs.priority == rhs.priority
                ? lhs.id < rhs.id
                : lhs.priority < rhs.priority
            }
            let id: Int
            let priority: Int
        }
        private var heap: HeapModule.Heap<Task> = []
        private var taskUser: [Int: Int] = [:] // taskId : userId
        private var taskPriority: [Int: Int] = [:] // taskId : priority
        init(_ tasks: [[Int]]) {
            tasks.forEach { task in
                add(task[0], task[1], task[2])
            }
        }
        
        func add(_ userId: Int, _ taskId: Int, _ priority: Int) {
            taskUser[taskId] = userId
            taskPriority[taskId] = priority
            heap.insert(.init(id: taskId, priority: priority))
        }
        
        func edit(_ taskId: Int, _ newPriority: Int) {
            heap.insert(.init(id: taskId, priority: newPriority))
            taskPriority[taskId] = newPriority
        }
        
        func rmv(_ taskId: Int) {
            taskPriority[taskId] = nil
        }
        
        func execTop() -> Int {
            while !heap.isEmpty {
                let task = heap.removeMax()
                if let p = taskPriority[task.id], task.priority == p {
                    taskPriority[task.id] = nil
                    return taskUser[task.id] ?? -1
                }
            }
            return -1
        }
    }

    func tests() {
        let t = TaskManager([[1, 101, 10], [2, 102, 20], [3, 103, 15]])
        t.add(4, 104, 5)
        t.edit(102, 8)
        print(t.execTop()) // 3
        t.rmv(101)
        t.add(5, 105, 15)
        print(t.execTop()) // 5
    }
}
