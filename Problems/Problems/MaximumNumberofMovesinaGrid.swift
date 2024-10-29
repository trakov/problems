class MaximumNumberofMovesinaGrid {
    // DP
    func maxMoves(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: 2), count: n)
        for i in 0..<n {
            dp[i][0] = 1
        }
        var result = 0
        for j in 1..<m {
            for i in 0..<n {
                if grid[i][j] > grid[i][j - 1] && dp[i][0] > 0 {
                    dp[i][1] = max(dp[i][1], dp[i][0] + 1)
                }
                if (i - 1 >= 0 &&
                    grid[i][j] > grid[i - 1][j - 1] &&
                    dp[i - 1][0] > 0) {
                    dp[i][1] = max(dp[i][1], dp[i - 1][0] + 1)
                }
                if (i + 1 < n &&
                    grid[i][j] > grid[i + 1][j - 1] &&
                    dp[i + 1][0] > 0) {
                    dp[i][1] = max(dp[i][1], dp[i + 1][0] + 1)
                }
                result = max(result, dp[i][1] - 1)
            }
            for k in 0..<n {
                dp[k][0] = dp[k][1]
                dp[k][1] = 0
            }
        }
        return result
    }

    // DFS
    func maxMoves2(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        
        func dfs(_ i: Int, _ j: Int, _ val: Int) -> Int {
            guard j < m else { return m - 1 }
            guard i >= 0 && i < n else { return 0 }
            guard val < grid[i][j] else { return j - 1 }
            return max(
                dfs(i - 1, j + 1, grid[i][j]),
                dfs(i, j + 1, grid[i][j]),
                dfs(i + 1, j + 1, grid[i][j])
            )
        }
        
        var result = 0
        for i in 0..<n {
            result = max(result, dfs(i, 0, 0))
            if result == m - 1 { return result }
        }
        
        return result
    }
    
    func tests() {
        print(maxMoves([[2,4,3,5],[5,4,9,3],[3,4,2,11],[10,9,13,15]])) // 3
        print(maxMoves([[3,2,4],[2,1,9],[1,1,7]])) // 0
        print(maxMoves([[1000000,92910,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,1039,1040,1041,1042,1043,1044,1045,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1061,1062,1063,1064,1065,1066,1067,1068],[1069,1070,1071,1072,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111,1112,1113,1114,1115,1116,1117,1118]]))
    }
}

