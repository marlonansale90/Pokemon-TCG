//
//  SearchCardEndPoint.swift
//  PokemonFeed
//
//  Created by Marlon Von Bernales Ansale on 27/02/2023.
//

import Foundation

public enum SearchCardEndPoint {
    case search(_ name:String)
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case let .search(name):
            return URL(string: "\(baseURL.absoluteString)/v2/cards?q=name:\(name)")!
        }
    }
    
}
