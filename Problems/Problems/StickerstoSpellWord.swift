class StickerstoSpellWord {
    func minStickers(_ sticker: String, _ target: String) -> Int {
        guard target.count > 0 else { return 0 }
        guard sticker.count > 0 else { return -1 }
        var stickerMap: [Character: Int] = [:] // char: count
        for c in sticker {
            stickerMap[c, default: 0] += 1
        }

        var wordMap: [Character: Int] = [:] // char: count
        for c in target {
            guard stickerMap[c] != nil else { return -1 }
            wordMap[c, default: 0] += 1
        }
        var result = 1
        for (c, count) in stickerMap {
            let t = wordMap[c] ?? 0
            result = max(result, t / count)
        }
        return result
    }

    func minStickers2(_ stickers: [String], _ target: String) -> Int {
        return -1
    }
    
    func tests() {
        print(minStickers("ban", "b")) // 1
        print(minStickers("ban", "ban")) // 1
        print(minStickers("ban", "bana")) // 2
        print(minStickers("ban", "banaa")) // 3
        print(minStickers("ban", "banana")) // 3
        print(minStickers("abc", "def")) // -1
        
//        print(minStickers2(["with","example","science"], "thehat")) // 3
//        print(minStickers2(["notice","possible"], "basicbasic")) // -1
    }
}

