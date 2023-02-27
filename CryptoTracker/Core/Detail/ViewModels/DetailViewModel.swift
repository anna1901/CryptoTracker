//
//  DetailViewModel.swift
//  CryptoTracker
//
//  Created by Anna Olak on 27/02/2023.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        coinDetailService = CoinDetailDataService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink { returnedCoinDetails in
                print("RECEIVED DETAILS:\n\(returnedCoinDetails)")
            }
            .store(in: &cancellables)
    }
}
