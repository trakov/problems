import HeapModule
final class DesignMovieRentalSystem {
    struct Movie: Comparable, Hashable {
        let shop: Int
        let movie: Int
        let price: Int
        static func <(lhs: Self, rhs: Self) -> Bool {
            if lhs.price == rhs.price && lhs.shop == rhs.shop {
                return lhs.movie < rhs.movie
            } else if lhs.price == rhs.price {
                return lhs.shop < rhs.shop
            } else {
                return lhs.price < rhs.price
            }
        }
    }
    class MovieRentingSystem {
        var movieToPrice: [Int: [Movie]] = [:]
        var shopToMovie: [Set<Movie>] = []
        var rentedMovie: HeapModule.Heap<Movie> = []
        var shopMovieMap: [[Int]: Movie] = [:]
        
        init(_ n: Int, _ entries: [[Int]]) {
            shopToMovie = Array(repeating: [], count: n)
            for i in entries {
                let movie = i[1]
                let shop = i[0]
                let price = i[2]
                let entry = Movie(shop: shop, movie:movie, price: price)
                movieToPrice[movie, default: []].append(entry)
                shopToMovie[shop].insert(entry)
                shopMovieMap[[shop, movie]] = entry
            }
            movieToPrice.keys.forEach {
                movieToPrice[$0]?.sort()
            }
        }
        
        func search(_ movie: Int) -> [Int] {
            var result = [Int]()
            var prices = movieToPrice[movie,default:[]]
            var head = 0
            while head < prices.count && result.count < 5 {
                let min = prices[head]
                if shopToMovie[min.shop].contains(min) {
                    result.append(min.shop)
                }
                head += 1
            }
            return result
        }
        
        func rent(_ shop: Int, _ movie: Int) {
            let entry = shopMovieMap[[shop, movie]]!
            shopToMovie[shop].remove(entry)
            rentedMovie.insert(entry)
        }
        
        func drop(_ shop: Int, _ movie: Int) {
            let entry = shopMovieMap[[shop, movie]]!
            shopToMovie[shop].insert(entry)
        }
        
        func report() -> [[Int]] {
            var result = [Movie]()
            var set = Set<Movie>()
            while !rentedMovie.isEmpty && result.count < 5 {
                let movie = rentedMovie.popMin()!
                if !shopToMovie[movie.shop].contains(movie) && !set.contains(movie) {
                    result.append(movie)
                    set.insert(movie)
                }
            }
            rentedMovie.insert(contentsOf:result)
            return result.map { [$0.shop, $0.movie]}
        }
    }
    
    func tests() {
        let m = MovieRentingSystem(3, [[0, 1, 5], [0, 2, 6], [0, 3, 7], [1, 1, 4], [1, 2, 7], [2, 1, 5]])
        print(m.search(1)) // [1, 0, 2]
        print(m.rent(0, 1)) //
        print(m.rent(1, 2)) //
        print(m.report()) // [[0, 1], [1, 2]]
        print(m.drop(1, 2)) //
        print(m.search(2)) // [0, 1]
    }
}
