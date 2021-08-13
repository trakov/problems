struct Packet {
    var arrival: Int
    var duration: Int
}
var size: Int?
var n: Int?
var queue = [Packet]()
var buffer = [Packet]()
//while let line = readLine(strippingNewline: false) {
//    guard let arr = line.split(separator: " ") as? [Int] else { fatalError("Bad line: \(line)") }
//    if size == nil {
//        size = arr.first
//        n = arr.last
//    } else if queue.count < n! {
//        queue.append(Packet(arrival: arr.first!, duration: arr.last!))
//    }
//    if queue.count == n! {
//        run()
//    }
//}
func run() {
//    var currentPacket: Packet?
    var currentTime = 0
    var index = 0
    while index < queue.count {
        let p = queue[index]
        print(p)
        if buffer.count < size! {
            print("append to buffer")
            buffer.append(p)
            index += 1
        } else if currentTime < p.arrival { // keep packet
            print("keep")
        } else { // throw
            print("-1")
            index += 1
        }
        let bp = buffer.first
        if process(bp) {
            buffer.removeFirst()
            print("\(currentTime - bp!.duration)")
        } else {
            print("processing...")
        }
        currentTime += 1
    }
    process(nil)
}
var processingPacket: Packet?
func process(_ p: Packet?) -> Bool {
    if let packet = processingPacket {
        if packet.duration > 1 {
            processingPacket?.duration -= 1
        } else {
            processingPacket = p
            return true
        }
    } else {
        processingPacket = p
        if let packet = processingPacket, packet.duration == 0 {
            processingPacket = nil
            return true
        }
    }
    return false
}

func test0() {
    size = 1
    n = 1
    queue = [
        Packet(arrival: 0, duration: 1)
    ]
    run()
}
func test1() {
    size = 1
    n = 1
    queue = [
        Packet(arrival: 0, duration: 0)
    ]
    run()
}
func test2() {
    size = 2
    n = 4
    queue = [
        Packet(arrival: 6, duration: 10),
        Packet(arrival: 7, duration: 3),
        Packet(arrival: 45, duration: 2),
        Packet(arrival: 50, duration: 10),
    ]
    run()
}
//test0()
