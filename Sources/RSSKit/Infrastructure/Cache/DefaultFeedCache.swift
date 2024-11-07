//
//  DefaultFeedCache.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation
import RSSKitDomain
import os.log

public final class DefaultFeedCache: FeedCache {
  private let storage: FeedStorage
  private let queue = DispatchQueue(label: "dev.nsfuntik.rsskit.cache", qos: .utility)
  private let logger: Logger

  public init(
    storage: FeedStorage = FileManagerFeedStorage(),
    logger: Logger = Logger(subsystem: "dev.nsfuntik.rsskit", category: "Cache")) {
    self.storage = storage
    self.logger = logger
  }

  public func feed(for sourceId: String) async throws -> Feed? {
    logger.debug("Attempting to retrieve feed from cache: \(sourceId)")

    guard let cached = try await storage.load(sourceId: sourceId) else {
      logger.debug("No cached feed found")
      return nil
    }

    if cached.isExpired {
      logger.debug("Cached feed is expired, removing")
      try await remove(for: sourceId)
      return nil
    }

    logger.debug("Successfully retrieved feed from cache")
    return cached.feed
  }

  public func save(_ feed: Feed, for sourceId: String) async throws {
    logger.debug("Saving feed to cache: \(sourceId)")

    let cached = CachedFeed(feed: feed)
    try await storage.save(cached, sourceId: sourceId)

    logger.debug("Successfully saved feed to cache")
  }

  public func remove(for sourceId: String) async throws {
    logger.debug("Removing feed from cache: \(sourceId)")
    try await storage.remove(sourceId: sourceId)
  }

  public func removeAll() async throws {
    logger.debug("Removing all cached feeds")
    try await storage.removeAll()
  }

  public func invalidate(olderThan date: Date) async throws {
    logger.debug("Invalidating old cache entries")
    let cachedFeeds = try await storage.loadAll()

    for cached in cachedFeeds where cached.timestamp < date {
      try await storage.remove(sourceId: cached.feed.id)
    }

    logger.debug("Cache invalidation completed")
  }
}
