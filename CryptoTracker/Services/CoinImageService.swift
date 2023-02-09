//
//  CoinImageService.swift
//  CryptoTracker
//
//  Created by Anna Olak on 09/02/2023.
//

import Foundation
import Combine
import SwiftUI

class CoinImageService {
    @Published var image: UIImage? = nil
    var imageSubscription: AnyCancellable?
    
    init(urlString: String) {
        getCoinImage(from: urlString)
    }
    
    private func getCoinImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ UIImage(data: $0) })
            .sink(receiveCompletion: NetworkingManager.handleCompetion(completion:), receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
}
