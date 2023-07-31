class CourseProcessingNetworkPackets {
    func process(size: Int, n: Int, packets: [(Int, Int)]) {
        guard !packets.isEmpty, size > 0 else { return }
        var buffer: [(Int, Int)] = []
        var time = 0
        var i = 0
        while i < packets.count {
            let packet = packets[i]
            
            if packet.0 == time {
                print(time)
            }
            
            time += 1
        }
        
        for packet in packets {
            buffer.append(packet)
            if buffer.count == size {
                let p = buffer.removeFirst()
                
            }
        }
    }
    
    func tests() {
        process(size: 1, n: 0, packets: []) // empty
        process(size: 1, n: 1, packets: [(0,0)]) // 0
        process(size: 1, n: 2, packets: [(0,1),(0,1)]) // 0 -1
        process(size: 1, n: 2, packets: [(0,1),(1,1)]) // 0 1
    }
}
