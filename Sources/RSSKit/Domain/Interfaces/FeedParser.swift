//
//  FeedParser.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation

public protocol FeedParser {
    func parse(_ data: Data, source: FeedSource) async throws -> Feed
    func canParse(_ format: FeedFormat) -> Bool
}
