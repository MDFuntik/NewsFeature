//
//  NetworkConfig.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//


public struct NetworkConfig {
    public let timeout: TimeInterval
    public let retryCount: Int
    public let cachePolicy: URLRequest.CachePolicy
    
    public static let `default` = NetworkConfig(
        timeout: 30,
        retryCount: 3,
        cachePolicy: .useProtocolCachePolicy
    )
    
    public init(
        timeout: TimeInterval = 30,
        retryCount: Int = 3,
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy
    ) {
        self.timeout = timeout
        self.retryCount = retryCount
        self.cachePolicy = cachePolicy
    }
}