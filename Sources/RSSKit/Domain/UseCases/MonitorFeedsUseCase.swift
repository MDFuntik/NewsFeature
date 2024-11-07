//
//  MonitorFeedsUseCase.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation

public protocol MonitorFeedsUseCase {
  func execute(sources: [FeedSource]) async -> AsyncStream<Result<Feed, Error>>
}
