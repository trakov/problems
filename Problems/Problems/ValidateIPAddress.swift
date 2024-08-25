class ValidateIPAddress {
    func validIPAddress(_ queryIP: String) -> String {
        if isIPv4(queryIP) {
            return "IPv4"
        } else if isIPv6(queryIP) {
            return "IPv6"
        } else {
            return "Neither"
        }
    }
    
    func isIPv4(_ ip: String) -> Bool {
        let comp = ip.components(separatedBy: ".")
        guard comp.count == 4 else { return false }
        for s in comp {
            guard s.count > 0 && s.count < 4 else { return false }
            guard let num = Int(s) else { return false }
            guard num >= 0 && num < 256 else { return false }
            guard s == String(num) else { return false }
        }
        return true
    }
    
    func isIPv6(_ ip: String) -> Bool {
        let comp = ip.components(separatedBy: ":")
        guard comp.count == 8 else { return false }
        for s in comp {
            guard s.count > 0 && s.count < 5 else { return false }
            for c in s {
                if !c.isWholeNumber && (c.lowercased() < "a" || c.lowercased() > "f") {
                    return false
                }
            }
        }
        return true
    }

    func tests() {
        print(validIPAddress("172.16.254.1")) // "IPv4"
        print(validIPAddress("2001:0db8:85a3:0:0:8A2E:0370:7334")) // "IPv6"
        print(validIPAddress("256.256.256.256")) // "Neither"
    }
}

