class ConstrainedSubsequenceSum {
	func constrainedSubsetSum(_ nums: [Int], _ k: Int) -> Int {
		var result = Int.min
		var l: [Int] = []
		var dp = Array(repeating: 0, count: nums.count)
		for i in 0...k - 1 {
			let tmp = max(nums[i], nums[i] + (l.isEmpty ? 0 : l[0]))
			result = max(result, tmp)
			dp[i] = tmp
			while l.count > 0 && l.last! < tmp {
				l.removeLast()
			}
			l.append(tmp)
		}
		for i in k...nums.count - 1 {
			let tmp = max(nums[i], nums[i] + (l.isEmpty ? 0 : l[0]))
			result = max(result, tmp)
			while l.count > 0 && l.last! < tmp {
				l.removeLast()
			}
			l.append(tmp)
			dp[i] = tmp
			if l[0] == dp[i - k] {
				l.removeFirst()
			}
		}
		return result
	}
	
	func tests() {
		print(constrainedSubsetSum([10,2,-10,5,20], 2)) // 37
		print(constrainedSubsetSum([-1,-2,-3], 1)) // -1
		print(constrainedSubsetSum([10,-2,-10,-5,20], 2)) // 23
	}
}

