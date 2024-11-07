//
//  FeedMonitor.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation

public protocol FeedMonitor {
  func startMonitoring(_ sources: [FeedSource]) async
  func stopMonitoring()
  var updates: AsyncStream<Result<Feed, Error>> { get }
}
