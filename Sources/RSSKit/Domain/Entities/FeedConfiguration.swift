//
//  FeedConfiguration.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation

public struct FeedConfiguration: Equatable, Codable {
  public let updateInterval: TimeInterval
  public let cachePolicy: CachePolicy
  public let maxItemAge: TimeInterval?

  public enum CachePolicy: String, Codable {
    case always
    case never
    case onlyOnError
  }

  public init(updateInterval: TimeInterval = 3600,
              cachePolicy: CachePolicy = .always,
              maxItemAge: TimeInterval? = nil) {
    self.updateInterval = updateInterval
    self.cachePolicy = cachePolicy
    self.maxItemAge = maxItemAge
  }
}
