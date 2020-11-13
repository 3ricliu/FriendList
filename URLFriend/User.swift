//
//  User.swift
//  URLFriend
//
//  Created by Eric Liu on 11/13/20.
//

import Foundation

struct User: Codable {
  let id: String
  let isActive: Bool
  let name: String
  let age: Int
  let company: String
  let email: String
  let address: String
  let about: String
  let registered: String
  let tags: [String]
  let friends: [Friend]
}
