//
//  Feed.swift
//  Feed
//
//  Created by Владимир on 07.09.2021.
//

import Foundation
import Combine

class Feed: ObservableObject {
  @Published var posts: [Post] = []
  @Published var loadError: Error?
  var signInSubscriber: AnyCancellable?
  var getPostsSubscriber: AnyCancellable?
  
  init() {
    signInSubscriber = NotificationCenter.default.publisher(for: .signInNotification)
      .sink { [weak self] _ in
        self?.loadFeed()
      }
  }
  
  func loadFeed() {
    print(#function)
    let client = APIClient()
    let request = PostRequest()
    getPostsSubscriber = client.publisherForRequest(request)
      .sink(receiveCompletion: { result in
        if case .failure(let error) = result {
          self.loadError = error
        }
      }, receiveValue: { newPosts in
        self.posts = newPosts
      })
  }
}
