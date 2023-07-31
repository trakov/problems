class AverageSalaryExcludingTheMinimumAndMaximumSalary {
    func average(_ salary: [Int]) -> Double {
        var maxS = Int.min
        var minS = Int.max
        var sum = 0
        salary.forEach { num in
            minS = min(minS, num)
            maxS = max(maxS, num)
            sum += num
        }
        return Double(sum - minS - maxS) / Double(salary.count - 2)
    }

    func tests() {
        print(average([4000,3000,1000,2000])) // 2500.00000
        print(average([1000,2000,3000])) // 2000.00000
    }
}
