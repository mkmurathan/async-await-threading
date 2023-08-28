

import Foundation

@MainActor
class CryptoListViewModel : ObservableObject {
    
    @Published var CryptoList = [CryptoVİewModel]()
    
    let WebService = webService()
    
    
    func DownloadCryptosAsync(url : URL) async {
        
        do {
            let cryptos = try await WebService.downloadCurrenciesAsync(url: url)
            
                self.CryptoList = cryptos.map(CryptoVİewModel.init)
            
        }catch{
            print(error)
        }
    }
    
    
    
    
    struct CryptoVİewModel {
        
        let crypto : CryptoCurrency
        
        var id : UUID? {
            crypto.id
        }
        
        var currency : String {
            crypto.currency
        }
        
        var price : String {
            crypto.price
        }
    }
}
