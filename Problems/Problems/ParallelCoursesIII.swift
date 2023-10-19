class ParallelCoursesIII {
	func minimumTime(_ n: Int, _ relations: [[Int]], _ time: [Int]) -> Int {
		var dict: [Int: [Int]] = [:] // Course : Precourses
		var seenCourse: [Int: Int] = [:] // Course: Time
		var result = 0
		for course in relations {
			dict[course[0], default: []].append(course[1])
		}

		func helperTime(course: Int) -> Int {
			if let cached = seenCourse[course] { return cached }
			seenCourse[course] = -1
			var maxTime = 0
			for precourse in dict[course] ?? [] {
				let preTime = helperTime(course: precourse)
				maxTime = max(maxTime, preTime)
			}
			seenCourse[course] = maxTime + time[course - 1]
			return seenCourse[course] ?? -9999
		}

		for courseId in 1...n {
			let totalTime = helperTime(course: courseId)
			result = max(result, totalTime)
		}

		return result
	}
	
	func tests() {
		print(minimumTime(3, [[1,3],[2,3]], [3,2,5])) // 8
		print(minimumTime(5, [[1,5],[2,5],[3,5],[3,4],[4,5]], [1,2,3,4,5])) // 12
	}
}

