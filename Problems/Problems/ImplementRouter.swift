import DequeModule
final class ImplementRouter {
    struct Packet: Hashable {
        let source: Int
        let destination: Int
        let timestamp: Int

        func deserialize() -> [Int] {
            return [source, destination, timestamp]
        }
    }

    class Router {
        private let memoryLimit: Int
        private var packetStorage: Set<Packet> = []
        private var packetQueue: DequeModule.Deque<Packet> = []
        private var destinations: [Int: DequeModule.Deque<Packet>] = [:]

        init(_ memoryLimit: Int) {
            self.memoryLimit = memoryLimit
        }
        
        func addPacket(_ source: Int, _ destination: Int, _ timestamp: Int) -> Bool {
            let packet = Packet(source: source, destination: destination, timestamp: timestamp)
            guard !packetStorage.contains(packet) else { return false }
            packetQueue.append(packet)
            packetStorage.insert(packet)
            destinations[destination, default: []].append(packet)
            trim()
            return true
        }
        
        func forwardPacket() -> [Int] {
            guard let packet = packetQueue.popFirst() else { return [] }
            packetStorage.remove(packet)
            destinations[packet.destination]?.popFirst()
            return packet.deserialize()
        }
        
        func getCount(_ destination: Int, _ startTime: Int, _ endTime: Int) -> Int {
            guard let queue = destinations[destination], !queue.isEmpty else { return 0 }

            var left = 0, right = queue.count - 1
            while left < right {
                let mid = left + (right - left) / 2
                if queue[mid].timestamp < startTime {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            guard queue[left].timestamp >= startTime && queue[left].timestamp <= endTime else { return 0 }
            let leftmost = left
            right = queue.count - 1
            while left <= right {
                let mid = left + (right - left) / 2
                if queue[mid].timestamp > endTime {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            return right - leftmost + 1
        }

        private func trim() {
            guard packetQueue.count > memoryLimit else { return }
            _ = forwardPacket()
        }
    }
    
    func tests() {
        let r = Router(3)
        print(r.addPacket(1, 4, 90)) // true
        print(r.addPacket(1, 4, 90)) // true
        print(r.addPacket(2, 5, 90)) // false
        print(r.addPacket(3, 5, 95)) // true
        print(r.addPacket(4, 5, 105)) // true
        print(r.forwardPacket()) // [2, 5, 90]
        print(r.addPacket(5, 2, 110)) // true
        print(r.getCount(5, 100, 110)) // 1
    }
}
