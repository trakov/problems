final class MinimumNumberofPeopletoTeach {
    func minimumTeachings(_ n: Int, _ languages: [[Int]], _ friendships: [[Int]]) -> Int {
        var cncon: Set<Int> = []
        for friendship in friendships {
            var mp: [Int: Int] = [:]
            var conm = false
            for lan in languages[friendship[0] - 1] {
                mp[lan] = 1
            }
            for lan in languages[friendship[1] - 1] {
                if mp[lan] != nil {
                    conm = true
                    break
                }
            }
            if !conm {
                cncon.insert(friendship[0] - 1)
                cncon.insert(friendship[1] - 1)
            }
        }
        var max_cnt = 0
        var cnt = Array(repeating: 0, count: n + 1)
        for friendship in cncon {
            for lan in languages[friendship] {
                cnt[lan] += 1
                max_cnt = max(max_cnt, cnt[lan])
            }
        }
        return cncon.count - max_cnt
    }
    
    func tests() {
        print(minimumTeachings(2, [[1],[2],[1,2]], [[1,2],[1,3],[2,3]])) // 1
        print(minimumTeachings(3, [[2],[1,3],[1,2],[3]], [[1,4],[1,2],[3,4],[2,3]])) // 2
    }
}
