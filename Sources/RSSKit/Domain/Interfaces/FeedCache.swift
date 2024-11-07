//
//  FeedCache.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

// MARK: - FeedCache

public protocol FeedCache {
  func feed(for sourceId: String) async throws -> Feed?
  func save(_ feed: Feed, for sourceId: String) async throws
  func remove(for sourceId: String) async throws
  func removeAll() async throws
  func invalidate(olderThan date: Date) async throws
}
