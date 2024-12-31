func solution(_ cacheSize: Int, _ cities:[String]) -> Int {
    var cache: [String] = [String](repeating: "", count: cacheSize)
    var result: Int = 0
    
    if cacheSize == 0 { return cities.count * 5 }
    
    for city in cities {
        let city = city.uppercased()
        
        if cache.contains(city) {
            cache.append(cache.remove(at: cache.firstIndex(of: city)!))
            result += 1
        } else {
            cache.removeFirst()
            cache.append(city)
            result += 5
        }
    }
    
    return result
}