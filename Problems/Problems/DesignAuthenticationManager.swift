class DesignAuthenticationManager {
    private let ttl: Int
    private var map: [String: Int] = [:]
    
    init(_ timeToLive: Int) {
        ttl = timeToLive
    }
    
    func generate(_ tokenId: String, _ currentTime: Int) {
        map[tokenId] = currentTime
    }
    
    func renew(_ tokenId: String, _ currentTime: Int) {
        guard isActive(tokenId: tokenId, currentTime: currentTime) else {
            map[tokenId] = nil
            return
        }
        map[tokenId] = currentTime
    }
    
    func countUnexpiredTokens(_ currentTime: Int) -> Int {
        var count = 0
        let tokenIds = map.keys
        for tokenId in tokenIds {
            if isActive(tokenId: tokenId, currentTime: currentTime) {
                count += 1
            } else {
                map[tokenId] = nil
            }
        }
        return count
    }

    func isActive(tokenId: String, currentTime: Int) -> Bool {
        guard let start = map[tokenId] else { return false }
        return currentTime >= start && currentTime < start + ttl
    }
    
    func tests() {
//        print(<#name#>) //
    }
}

