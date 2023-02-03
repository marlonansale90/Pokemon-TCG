//
//  DeckStore.swift
//  PokemonFeed
//
//  Created by Marlon Ansale on 2/3/23.
//

import Foundation

public typealias CachedDeck = (decks: [LocalDeck], timestamp: Date)

public protocol DeckStore {
    func insert(_ deck: LocalDeck, timestamp: Date) throws
    func update(_ deck: LocalDeck, timestamp: Date) throws
    func retrieve() throws -> CachedDeck?
}
