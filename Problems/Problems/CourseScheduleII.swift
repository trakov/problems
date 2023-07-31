class CourseScheduleII {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        func dfs(_ course: Int) -> Bool {
            guard visited[course] != 1 else { return true }
            if visited[course] == 0 {
                visited[course] = 1
                for ele in graph[course] ?? [] {
                    if dfs(ele) { return true }
                }
            }
            visited[course] = 2
            if ansDict[course] == nil {
                ans.append(course)
                ansDict[course] = 0
            }
            return false
        }
        var ans: [Int] = []
        var visited: [Int] = Array(repeating: 0, count: numCourses)
        var graph: Dictionary<Int, Set<Int>> = [:]
        var ansDict: Dictionary<Int, Int> = [:]
        for ele in prerequisites {
            graph[ele[0], default: []].insert(ele[1])
        }
        for course in graph.keys {
            if dfs(course) { return [] }
        }
        if ans.count < numCourses {
            for i in 0 ..< numCourses {
                if ansDict[i] == nil {
                    ans.append(i)
                    ansDict[i] = 0
                }
            }
        }
        return ans
    }

    func findOrder2(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var map: [Int: [Int]] = [:]
        var visited: Set<Int> = []
        var result: [Int] = []
        
        for pre in prerequisites {
            map[pre[0], default: []].append(pre[1])
        }
        
        func dfs(_ course: Int) -> Bool {
            guard !visited.contains(course) else { return false }
            let dependencies = map[course] ?? []
            guard !dependencies.isEmpty else { return true }
            visited.insert(course)
            for dep in dependencies {
                guard dfs(dep) else { return false }
            }
            visited.remove(course)
            map[course] = []
            return true
        }

        for course in map.keys {
            guard dfs(course) else { return [] }
        }
        return result
    }

    func tests() {
        print(findOrder(4, [[1,0],[2,0],[3,1],[3,2]])) // [0,2,1,3]
        print(findOrder(8, [[1,0],[2,6],[1,7],[5,1],[6,4],[7,0],[0,5]])) // false
        print(findOrder(2, [[1,0]])) // true
        print(findOrder(2, [[1,0],[0,1]])) // false
    }
}
