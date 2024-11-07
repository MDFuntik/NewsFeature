//
//  FeedService.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation

public protocol FeedService {
  func fetch(from source: FeedSource) async throws -> Feed
  func fetchMultiple(from sources: [FeedSource]) async throws -> [Result<Feed, Error>]
  func invalidateCache(for sourceId: String) async
}
