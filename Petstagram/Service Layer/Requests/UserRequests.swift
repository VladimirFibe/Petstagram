//
//  UserRequests.swift
//  UserRequests
//
//  Created by Владимир on 06.09.2021.
//

import Foundation

extension Notification.Name {
  static let signInNotification = Notification.Name("SignInNotification")
  static let signOutNotification = Notification.Name("SignOutNotification")
}

struct SignInUserRequest: APIRequest {
  typealias Response = Void
  let user: UserAuthentication
  
  var method: HTTPMethod { return .GET }
  var path: String { return "/user" }
  var body: Data? { return nil }
  
  init(username: String, password: String) {
    self.user = UserAuthentication(id: username, password: password)
  }
  
  func handle(response: Data) throws -> Void {
    currentUser = user
    NotificationCenter.default.post(name: .signInNotification, object: nil)
  }
}

struct SignUpUserRequest: APIRequest {
  let user: UserAuthentication
  typealias Response = Void
  
  var method: HTTPMethod { return .POST }
  var path: String { return "/user" }
  var body: Data? { return try? JSONEncoder().encode(user) }
  
  init(username: String, email: String, password: String) {
    self.user = UserAuthentication(id: username, email: email, password: password)
  }
  
  func handle(response: Data) throws -> Void {
    currentUser = user
    NotificationCenter.default.post(name: .signInNotification, object: nil)
  }
}
