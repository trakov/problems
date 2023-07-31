class CanPlaceFlowers {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var count = 0
        var i = 0
        while i < flowerbed.count {
            if flowerbed[i] == 1 {
                i += 2
                continue
            }
            if i == flowerbed.count - 1 || flowerbed[i + 1] == 0 {
                count += 1
                i += 2
            } else {
                i += 1
            }
        }
        return count >= n
    }
    
    func tests() {
        print(canPlaceFlowers([1,0,0,0,1], 1)) // true
        print(canPlaceFlowers([1,0,0,0,1], 2)) // false
        print(canPlaceFlowers([1,0,0,0,1,0], 1)) // true
        print(canPlaceFlowers([1,0,0,0,1,0,0], 3)) // false
        print(canPlaceFlowers([1,0,0,0,1,0,0], 2)) // true
    }
}

