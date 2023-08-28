

import Foundation


class webService {
    
    
    func downloadCurrenciesAsync(url : URL) async throws -> [CryptoCurrency] {
        
        let (data , _ ) = try await URLSession.shared.data(from: url)
        
        let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
        
        return currencies ?? []
    }
    
    
    
    
}


enum downloaderError : Error {
    case badUrl
    case noData
    case dataParseError
}
