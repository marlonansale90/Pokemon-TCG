//
//  SearchCardViewModel.swift
//  PokemonFeed
//
//  Created by Marlon Von Bernales Ansale on 22/02/2023.
//

import Foundation

public struct SearchCardViewModel {
    public let name: String
    public let price: String
    public let cardId: String
    public let boosterSet: String
    public let boosterSetId: String
    public let series: String
    
    public init(name: String, price: String, cardId: String, boosterSet: String, boosterSetId: String, series: String) {
        self.name = name
        self.price = price
        self.cardId = cardId
        self.boosterSet = boosterSet
        self.boosterSetId = boosterSetId
        self.series = series
    }
}

