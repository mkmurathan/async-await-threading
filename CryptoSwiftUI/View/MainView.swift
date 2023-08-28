

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    
    init() {
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    var body: some View {
    
        NavigationStack {
            
            List(cryptoListViewModel.CryptoList, id: \.id) { crypto in
                VStack{
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(.gray)
                        .frame(maxWidth : .infinity, alignment: .leading)
                    
                    Text(crypto.price)
                        .foregroundColor(.black)
                        .frame(maxWidth : .infinity, alignment: .leading)
                }
                
            }.toolbar(content: {
                Button {
                    Task.init{
                        await cryptoListViewModel.DownloadCryptosAsync(url: URL(string:  "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
                    }
                } label: {
                    Text("refresh")
                }

            })
            
            .navigationTitle(Text("crypto"))
            
        }.task {
            await cryptoListViewModel.DownloadCryptosAsync(url: URL(string:  "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
