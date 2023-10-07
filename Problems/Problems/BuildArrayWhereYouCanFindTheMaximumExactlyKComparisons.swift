class BuildArrayWhereYouCanFindTheMaximumExactlyKComparisons {
	func numOfArrays(_ n: Int, _ m: Int, _ k: Int) -> Int {
		let empty2D = Array(repeating: Array(repeating: 0, count: k+1), count: m+1)
		var dp = empty2D
		var prefix = empty2D
		var prevDp = empty2D
		var prevPrefix = empty2D
		let MOD = 1_000_000_007
		for num in 1..<m + 1 {
			dp[num][1] = 1
		}
		for i in 1..<n + 1 {
			if i > 1 {
				dp = empty2D
			}
			prefix = empty2D
			for maxNum in 1..<m+1 {
				for cost in 1..<k+1 {
					var ans = (maxNum * prevDp[maxNum][cost]) % MOD
					ans = (ans + prevPrefix[maxNum - 1][cost - 1]) % MOD

					dp[maxNum][cost] += ans
					dp[maxNum][cost] %= MOD
					
					prefix[maxNum][cost] = (prefix[maxNum - 1][cost] + dp[maxNum][cost])
					prefix[maxNum][cost] %= MOD
				}
			}
			prevDp = dp
			prevPrefix = prefix
		}
		return prefix[m][k]
	}
	
	func tests() {
		print(numOfArrays(2, 3, 1)) // 6
		print(numOfArrays(5, 2, 3)) // 0
		print(numOfArrays(9, 1, 1)) // 1
	}
}

