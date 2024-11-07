//
//  CachedFeed.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation

public struct CachedFeed: Codable {
    public let feed: Feed
    public let timestamp: Date
    public let expirationDate: Date
    
    public init(feed: Feed, timestamp: Date = Date()) {
        self.feed = feed
        self.timestamp = timestamp
        self.expirationDate = timestamp.addingTimeInterval(feed.configuration.updateInterval)
    }
    
    public var isExpired: Bool {
        Date() > expirationDate
    }
}
