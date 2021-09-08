//
//  UserAuthentication.swift
//  UserAuthentication
//
//  Created by Владимир on 06.09.2021.
//

import Foundation

var currentUser: UserAuthentication?
struct UserAuthentication: Codable {
  var id: String
  var email: String?
  var password: String?
}
