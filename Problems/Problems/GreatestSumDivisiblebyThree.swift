final class GreatestSumDivisiblebyThree {
    func maxSumDivThree(_ nums: [Int]) -> Int {
        let bigNum = 1_000_000_007
        var result = 0
        var min1 = (bigNum, bigNum)
        var min2 = (bigNum, bigNum)
        for num in nums {
            if num % 3 == 1 {
                if num < min1.0 {
                    (min1.1, min1.0) = (min1.0, num)
                } else if num < min1.1 {
                    min1.1 = num
                }
            } else if num % 3 == 2 {
                if num < min2.0 {
                    (min2.1, min2.0) = (min2.0, num)
                } else if num < min2.1 {
                    min2.1 = num
                }
            }
            result += num
        }
        if result % 3 == 1 {
            return max(0, result - min1.0, result - min2.0 - min2.1)
        } else if result % 3 == 2 {
            return max(0, result - min2.0, result - min1.0 - min1.1)
        }
        return result
    }
    
    func tests() {
        print(maxSumDivThree([3,6,5,1,8])) // 18
        print(maxSumDivThree([4])) // 0
        print(maxSumDivThree([1,2,3,4,4])) // 12
        print(maxSumDivThree([972,944,817,475,436,623,900,268,25,263,627,799,38,943,968,17,813,139,772,333,498,593,567,556,550,40,4,862,915,935,366,253,994,893,47,211,332,854,73,694,37,63,789,785,419,129,170,404,854,424,712,784,539,697,478,978,509,76,528,65,194,352,986,713,730,223,858,366,71,18,60,8,835,70,349,905,446,593,909,592,95,280,900,887,303,245,612,708,7,58,564,577,718,410,512,637,535,432,332,770])) // 49701
    }
}
