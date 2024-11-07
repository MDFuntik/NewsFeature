//
//  FeedSource.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation

public struct FeedSource: Equatable, Identifiable, Codable {
  public let id: String
  public let name: String
  public let url: URL
  public let format: FeedFormat
  public let configuration: FeedConfiguration

  public init(
    id: String,
    name: String,
    url: URL,
    format: FeedFormat = .rss2,
    configuration: FeedConfiguration = FeedConfiguration()) {
    self.id = id
    self.name = name
    self.url = url
    self.format = format
    self.configuration = configuration
  }
}
