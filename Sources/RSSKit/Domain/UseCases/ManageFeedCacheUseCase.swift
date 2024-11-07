//
//  ManageFeedCacheUseCase.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation

public protocol ManageFeedCacheUseCase {
  func clearCache() async throws
  func invalidateCache(for sourceId: String) async throws
  func cleanupExpiredCache() async throws
}
