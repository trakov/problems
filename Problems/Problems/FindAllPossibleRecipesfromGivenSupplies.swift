class FindAllPossibleRecipesfromGivenSupplies {
    func findAllRecipes(_ recipes: [String], _ ingredients: [[String]], _ supplies: [String]) -> [String] {
        var availableSupplies: Set<String> = Set(supplies)
        var recipeToIndex: [String: Int] = [:]
        var dependencyGraph: [String: [String]] = [:]
        for (i, recipe) in recipes.enumerated() {
            recipeToIndex[recipe] = i
        }
        var inDegree = Array(repeating: 0, count: recipes.count)
        for (i, recipe) in recipes.enumerated() {
            for ingredient in ingredients[i] {
                if !availableSupplies.contains(ingredient) {
                    dependencyGraph[ingredient, default: []].append(recipe)
                    inDegree[i] += 1
                }
            }
        }
        var queue: [Int] = []
        for i in 0..<recipes.count where inDegree[i] == 0 {
            queue.append(i)
        }
        var result: [String] = []
        while !queue.isEmpty {
            let i = queue.removeFirst()
            let recipe = recipes[i]
            result.append(recipe)
            guard let depends = dependencyGraph[recipe] else { continue }
            for dependent in depends {
                inDegree[recipeToIndex[dependent]!] -= 1
                if inDegree[recipeToIndex[dependent]!] == 0 {
                    queue.append(recipeToIndex[dependent]!)
                }
            }
        }
        return result
    }
    
    func tests() {
        print(findAllRecipes(
            ["bread"],
            [["yeast","flour"]],
            ["yeast","flour","corn"]
        )) // ["bread"]
        print(findAllRecipes(
            ["bread","sandwich"],
            [["yeast","flour"],["bread","meat"]],
            ["yeast","flour","meat"]
        )) // ["bread","sandwich"]
        print(findAllRecipes(
            ["bread","sandwich","burger"],
            [["yeast","flour"],["bread","meat"],["sandwich","meat","bread"]],
            ["yeast","flour","meat"]
        )) // ["bread","sandwich","burger"]
    }
}
