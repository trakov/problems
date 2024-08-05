class IntegertoEnglishWords {
    private let kAtomicWords = [1:"One",2:"Two",3:"Three",4:"Four",5:"Five",6:"Six",
                                7:"Seven",8:"Eight",9:"Nine",10:"Ten",11:"Eleven",
                                12:"Twelve",13:"Thirteen",14:"Fourteen",15:"Fifteen",
                                16:"Sixteen",17:"Seventeen",18:"Eighteen",19:"Nineteen",
                                20:"Twenty",30:"Thirty",40:"Forty",50:"Fifty",60:"Sixty",
                                70:"Seventy",80:"Eighty",90:"Ninety"]

    private let kAtomicPowers = [100: "Hundred",
                                1_000: "Thousand",
                                1_000_000: "Million",
                                1_000_000_000: "Billion",
                                1_000_000_000_000: "Trillion"]

    func numberToWords(_ num: Int) -> String {
        guard num != 0 else { return "Zero" }
        // Remove nils and join by " "
        return wordFor(num).flatMap{$0}.joined(separator: " ")
    }

    /// Recursively build
    private func wordFor(_ num: Int) -> [String?] {
        var result = [String?]()
        
        // 0-19
        if num < 20 {
            result.append(kAtomicWords[num])
        }
        // 20-99
        else if num  < 100 {
            let leastSig = num % 10
            let mostSig = (num/10) * 10
            result.append(kAtomicWords[mostSig])
            if leastSig > 0 {
               result.append(kAtomicWords[leastSig])
            }
        }
        // 1Y xx - 1YY xxx xxx xxx xxx
        else {
            // get largest power of number
            var power = 100
            while (num / (power*10)) > 0 {
                power *= 10
            }
            // divide by 10 until we find closest atomic word power
            while kAtomicPowers[power] == nil {
                power /= 10
            }
            
            var mostSig = num / power
            let remainder = num - (mostSig * power)
    
            result.append(contentsOf: wordFor(mostSig))
            result.append(kAtomicPowers[power])
            result.append(contentsOf: wordFor(remainder))
        }
        
        return result
    }

    func tests() {
        print(numberToWords(123)) // One Hundred Twenty Three
        print(numberToWords(12345)) // Twelve Thousand Three Hundred Forty Five
        print(numberToWords(1234567))
        // One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven
    }
}

