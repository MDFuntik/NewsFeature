//
//  FeedValidator.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

import Foundation

public protocol FeedValidator {
    func validate(_ feed: Feed) throws
    func validateItem(_ item: FeedItem) throws
}
