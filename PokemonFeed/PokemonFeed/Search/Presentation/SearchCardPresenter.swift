//
//  SearchCardPresenter.swift
//  PokemonFeed
//
//  Created by Marlon Von Bernales Ansale on 22/02/2023.
//

import Foundation

public final class SearchCardPresenter {
    public static var searchPlaceholder: String {
        NSLocalizedString(
            "SEARCH_PLACEHOLDER",
            tableName: "SearchCard",
            bundle: Bundle(for: SearchCardPresenter.self),
            comment: "Search Placeholder")
    }
    
    public static func map(_ cards:[Card], priceFormat:  NumberFormatter) -> [SearchCardViewModel] {
        cards.map { card in
            SearchCardViewModel(
                name: card.name,
                price: priceFormat.getPrice(price: card.cardmarket?.prices.trendPrice),
                cardId: card.id,
                boosterSet: card.cardSet.name,
                boosterSetId: card.cardSet.id,
                series: card.cardSet.series
            )
        }
    }
}
