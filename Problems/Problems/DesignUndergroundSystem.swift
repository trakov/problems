class DesignUndergroundSystem {
    private var pass: [Int: (String, Int)] = [:]
    private var cache: [Int: (Double, Double)] = [:] // key : (sum, count)
    init() {
    }
    
    func checkIn(_ id: Int, _ stationName: String, _ t: Int) {
        pass[id] = (stationName, t)
    }
    
    func checkOut(_ id: Int, _ stationName: String, _ t: Int) {
        guard let (startStation, departure) = pass[id] else { fatalError() }
        let key = hashJourney(startStation, stationName)
        let cached = cache[key] ?? (0, 0)
        cache[key] = (cached.0 + Double(t - departure), cached.1 + 1)
    }
    
    func getAverageTime(_ startStation: String, _ endStation: String) -> Double {
        guard let cached = cache[hashJourney(startStation, endStation)] else {
            fatalError()
        }
        return cached.0 / cached.1
    }

    private func hashJourney(_ s1: String, _ s2: String) -> Int {
        (s1 + "_" + s2).hashValue
    }
    
    func tests() {
        let undergroundSystem = DesignUndergroundSystem()
        print(undergroundSystem.checkIn(45, "Leyton", 3))
        print(undergroundSystem.checkIn(32, "Paradise", 8))
        print(undergroundSystem.checkIn(27, "Leyton", 10))
        print(undergroundSystem.checkOut(45, "Waterloo", 15))  // Customer 45 "Leyton" -> "Waterloo" in 15-3 = 12
        print(undergroundSystem.checkOut(27, "Waterloo", 20))  // Customer 27 "Leyton" -> "Waterloo" in 20-10 = 10
        print(undergroundSystem.checkOut(32, "Cambridge", 22)) // Customer 32 "Paradise" -> "Cambridge" in 22-8 = 14
        print(undergroundSystem.getAverageTime("Paradise", "Cambridge")) // 14.00000. One trip "Paradise" -> "Cambridge", (14)/1=14
        print(undergroundSystem.getAverageTime("Leyton", "Waterloo")) // 11.00000. Two trips "Leyton" -> "Waterloo", (10 + 12) / 2 = 11
        print(undergroundSystem.checkIn(10, "Leyton", 24))
        print(undergroundSystem.getAverageTime("Leyton", "Waterloo"));    // return 11.00000
        print(undergroundSystem.checkOut(10, "Waterloo", 38))  // Customer 10 "Leyton" -> "Waterloo" in 38-24 = 14
        print(undergroundSystem.getAverageTime("Leyton", "Waterloo")) // 12.00000. Three trips "Leyton" -> "Waterloo", (10 + 12 + 14) / 3 = 12
    }
}

