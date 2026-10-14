//
//  Tile.swift
//  Twenty2048-1-hour
//
//  Created by Michał Wolanin on 14/10/2026.
//

import Foundation

/// the identity of a tile: kept while the tile slides, lost when it merges
struct TileID: Hashable, Sendable {
    let rawValue: UInt64
}

/// hands out tile identities, never the same one twice,
/// a value rather than a global counter, so a session stays reproducible
struct TileIDGenerator: Equatable, Sendable {
    private var upcoming: UInt64 = 0
    
    init() {}
    
    mutating func next() -> TileID {
        defer { upcoming += 1 }
        return .init(rawValue: upcoming)
    }
}

/// a numbered tile. the value is a power of two, at least 2
struct Tile: Hashable, Sendable {
    let id: TileID
    let value: Int
}

/// a tile together with the cell it occupies
struct PlacedTile: Hashable, Sendable {
    let tile: Tile
    let position: Position
}
