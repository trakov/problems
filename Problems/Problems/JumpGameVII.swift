final class JumpGameVII {
    func canReach(_ s: String, _ minJump: Int, _ maxJump: Int) -> Bool {
        let s = Array(s)
        let n = s.count
        var f = Array(repeating: 0, count: n)
        var pre = Array(repeating: 0, count: n)
        f[0] = 1
        for i in 0..<minJump {
            pre[i] = 1
        }
        for i in minJump..<n {
            let left = i - maxJump
            let right = i - minJump
            if s[i] == "0" {
                let total = pre[right] - (left <= 0 ? 0 : pre[left - 1])
                f[i] = total != 0 ? 1 : 0
            }
            pre[i] = pre[i - 1] + f[i]
        }
        return f[n - 1] == 1
    }
    
    func tests() {
        print(canReach("011010", 2, 3)) // true
        print(canReach("01101110", 2, 3)) // false
    }
}
