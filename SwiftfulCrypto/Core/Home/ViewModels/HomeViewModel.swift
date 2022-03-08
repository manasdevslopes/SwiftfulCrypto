//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by MANAS VIJAYWARGIYA on 07/03/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var statistics: [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentageChange: 1),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentageChange: -7),
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    
    func addSubscribers() {
        // Single publisher
        // dataService.$allCoins
           //  .sink { [weak self] (returnedCoins) in
           //      self?.allCoins = returnedCoins
           //  }
           //  .store(in: &cancellables)
        
        // combine publishers using .combineLatest
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercassedText = text.lowercased()

        return coins.filter { coin -> Bool in
            return coin.name.lowercased().contains(lowercassedText) ||
                   coin.symbol.lowercased().contains(lowercassedText) ||
                   coin.id.lowercased().contains(lowercassedText)
        }
    }
}
