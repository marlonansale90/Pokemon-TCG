//
//  SearchCardsUIComposer.swift
//  PokemonTCG
//
//  Created by Marlon Von Bernales Ansale on 18/07/2023.
//

import UIKit
import Combine
import PokemonFeed
import PokemoniOS

public enum SearchCardsUIComposer {
    private typealias SearchCardsPresentationAdapter = LoadResourcePresentationAdapter<[Card], SearchCardsViewAdapter>
}

final class SearchCardsViewAdapter: ResourceView {
    func display(_ viewModel: CardsViewModel) {
        
    }
}
