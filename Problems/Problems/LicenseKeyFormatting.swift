class LicenseKeyFormatting {
    func licenseKeyFormatting(_ s: String, _ k: Int) -> String {
        var result: [Character] = []
        var i = 0
        for c in s.reversed() {
            if c == "-" { continue }
            if i == k {
                result += "-"
                i = 0
            }
            result += c.uppercased()
            i += 1
        }
        
        return String(result.reversed())
    }

    func tests() {
        print(licenseKeyFormatting("5F3Z-2e-9-w", 4)) // "5F3Z-2E9W"
        print(licenseKeyFormatting("2-5g-3-J", 2)) // "2-5G-3J"
        print(licenseKeyFormatting("2-4A0r7-4k", 4)) // "24A0-R74K"
        print(licenseKeyFormatting("--a-a-a-a--", 2)) // "AA-AA"
    }
}
