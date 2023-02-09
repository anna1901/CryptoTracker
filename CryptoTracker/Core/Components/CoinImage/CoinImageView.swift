//
//  CoinImageView.swift
//  CryptoTracker
//
//  Created by Anna Olak on 09/02/2023.
//

import SwiftUI

struct CoinImageView: View {
    @StateObject var vm: CoinImageViewModel
    
    init(url: String) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(urlString: url))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(url: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=pln&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
