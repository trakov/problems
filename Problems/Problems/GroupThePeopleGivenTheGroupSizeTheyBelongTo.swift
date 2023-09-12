class GroupThePeopleGivenTheGroupSizeTheyBelongTo {
	func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
		let sorted = groupSizes.enumerated().sorted {
			$0.1 < $1.1
		}
		var result: [[Int]] = []
		var i = 0
		while i < sorted.count {
			result.append(sorted[i..<(i + sorted[i].1)].map { $0.0 })
			i += sorted[i].1
		}
		return result
	}
	
	func tests() {
		print(groupThePeople([3,3,3,3,3,1,3])) // [[5],[0,1,2],[3,4,6]]
		print(groupThePeople([2,1,3,3,3,2])) // [[1],[0,5],[2,3,4]]
	}
}

