import Foundation
final class CouponCodeValidator {
    enum Category: String {
        case electronics
        case grocery
        case pharmacy
        case restaurant
    }
    
    func validate(_ id: String) -> Bool {
        !id.isEmpty && id.allSatisfy { c in
            c.isNumber || c.isLetter || c == "_"
        }
    }
    
    func validateCoupons(_ code: [String], _ businessLine: [String], _ isActive: [Bool]) -> [String] {
        var map: [Category: [String]] = [:]
        for (id, (cat, active)) in zip(code, zip(businessLine, isActive)) where active {
            guard let cat = Category(rawValue: cat) else { continue }
            guard validate(id) else { continue }
            map[cat, default: []].append(id)
        }
        return (map[.electronics]?.sorted() ?? []) +
        (map[.grocery]?.sorted() ?? []) +
        (map[.pharmacy]?.sorted() ?? []) +
        (map[.restaurant]?.sorted() ?? [])
    }
    
    func tests() {
        print(validateCoupons(
            ["SAVE20","","PHARMA5","SAVE@20"], ["restaurant","grocery","pharmacy","restaurant"],[true,true,true,true]
        )) // ["PHARMA5","SAVE20"]
        print(validateCoupons(
            ["GROCERY15","ELECTRONICS_50","DISCOUNT10"], ["grocery","electronics","invalid"], [false,true,true]
        )) // ["ELECTRONICS_50"]
    }
}
