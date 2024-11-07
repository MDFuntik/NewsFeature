//
//  BackgroundTaskManager.swift
//  NewsFeature
//
//  Created by Dmitry Mikhailov on 07.11.2024.
//

// MARK: - BackgroundTaskManager

public protocol BackgroundTaskManager {
  func registerTasks()
  func scheduleFeedRefresh()
  func scheduleCleanup()
}

/
