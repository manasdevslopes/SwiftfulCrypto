//
//  DetailViewModel.swift
//  SwiftfulCrypto
//
//  Created by MANAS VIJAYWARGIYA on 10/03/22.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
//    @Published var _ : CoinDetailModel
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()

    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink { [weak self] (returnedCoinDetails) in
                print("returned", returnedCoinDetails)
            }
            .store(in: &cancellables)
    }
}
