class NumberOfLaserBeamsInABank {
    func numberOfBeams(_ bank: [String]) -> Int {
        var result = 0
        var prevLasers = 0
        for floor in bank {
            let lasers = Dictionary(floor.map { ($0, 1) }, uniquingKeysWith: +)["1"] ?? 0
            result += prevLasers * lasers
            if lasers != 0 {
                prevLasers = lasers
            }
        }
        return result
    }
    
    func tests() {
        print(numberOfBeams(["011001","000000","010100","001000"])) // 8
        print(numberOfBeams(["000","111","000"])) // 0
    }
}

