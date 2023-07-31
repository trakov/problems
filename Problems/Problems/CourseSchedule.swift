class CourseSchedule {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var map: [Int: [Int]] = [:]
        var visited: Set<Int> = []
        
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
            guard dfs(course) else { return false }
        }
        return true
    }

    func tests() {
        print(canFinish(8, [[1,0],[2,6],[1,7],[5,1],[6,4],[7,0],[0,5]])) // false
        print(canFinish(2, [[1,0]])) // true
        print(canFinish(2, [[1,0],[0,1]])) // false
    }
}
