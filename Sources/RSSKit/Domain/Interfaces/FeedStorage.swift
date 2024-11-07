//
//  FeedStorage.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation

public protocol FeedStorage {
  func load(sourceId: String) async throws -> CachedFeed?
  func save(_ cached: CachedFeed, sourceId: String) async throws
  func remove(sourceId: String) async throws
  func removeAll() async throws
}
