//
//  CoinImageService.swift
//  CryptoTracker
//
//  Created by Anna Olak on 09/02/2023.
//

import Foundation
import Combine

class CoinImageService {
    @Published var image: Data? = nil
    var coinSunbscription: AnyCancellable?
    
    init(url: URL) {
        getCoinImage(from: url)
    }
    
    private func getCoinImage(from url: URL) {
        coinSunbscription = NetworkingManager.download(url: url)
            .sink(receiveCompletion: NetworkingManager.handleCompetion(completion:), receiveValue: { [weak self] data in
                self?.image = data
                self?.coinSunbscription?.cancel()
            })
    }
}
