class SeatReservationManager {
    private var n: Int
    private var array: [Int] = []
    
    init(_ n: Int = 1) {
        self.n = n
    }
    
    func reserve() -> Int {
        if array.count == array.last ?? 0 {
            let res = (array.last ?? 0) + 1
            array.append(res)
            return res
        }
        if array.first! > 1 {
            array.insert(1, at: 0)
            return 1
        }
        var left = 0
        var right = array.count - 1
        
        while left < right {
            let mid = (left + right) / 2
            if array[mid] == mid + 1 {
                left = mid + 1
            } else {
                right = mid
            }
        }
        array.insert(array[left - 1] + 1, at: left)
        return array[left]
    }
    
    func unreserve(_ seatNumber: Int) {
        var left = 0
        var right = array.count - 1
        
        while left <= right {
            let mid = (left + right) / 2
            if array[mid] == seatNumber {
                array.remove(at: mid)
                return
            } else if array[mid] > seatNumber {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
    }
    
    func tests() {
        let a = SeatReservationManager(5)
        print(a.reserve()) // 1
        print(a.reserve()) // 2
        print(a.unreserve(2)) //
        print(a.reserve()) // 2
        print(a.reserve()) // 3
        print(a.reserve()) // 4
        print(a.reserve()) // 5
        print(a.unreserve(5)) //
    }
}

