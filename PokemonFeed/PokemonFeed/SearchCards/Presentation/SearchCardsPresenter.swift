//
//  SearchCardsPresenter.swift
//  PokemonFeed
//
//  Created by Marlon Von Bernales Ansale on 18/07/2023.
//

import Foundation

public final class SearchCardsPresenter {
    public static var title: String {
        NSLocalizedString(
            "SEARCH_CARDS_TITLE",
            tableName: "SearchCards",
            bundle: Bundle(for: SearchCardsPresenter.self),
            comment: "Title for the search cards")
    }
}
