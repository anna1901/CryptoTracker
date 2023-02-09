//
//  CoinImageView.swift
//  CryptoTracker
//
//  Created by Anna Olak on 09/02/2023.
//

import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private var coinImageService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(url: URL) {
        coinImageService = CoinImageService(url: url)
        getImage()
    }
    
    private func getImage() {
        coinImageService.$image
            .sink(receiveValue: { [weak self] data in
                guard let imageData = data else { return }
                self?.image = UIImage(data: imageData)
            })
            .store(in: &cancellables)
        
    }
}

struct CoinImageView: View {
    
    @ObservedObject var vm: CoinImageViewModel
    
    init(url: URL) {
        vm = CoinImageViewModel(url: url)
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
        CoinImageView(url: URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=pln&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
