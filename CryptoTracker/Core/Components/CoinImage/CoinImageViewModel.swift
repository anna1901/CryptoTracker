//
//  CoinImageViewModel.swift
//  CryptoTracker
//
//  Created by Anna Olak on 09/02/2023.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = true
    
    private let dataService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(urlString: String) {
        dataService = CoinImageService(urlString: urlString)
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink(
                receiveCompletion: { [weak self] _ in self?.isLoading = false },
                receiveValue: { [weak self] image in
                    self?.image = image
                })
            .store(in: &cancellables)
    }
}
