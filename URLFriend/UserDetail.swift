//
//  UserDetail.swift
//  URLFriend
//
//  Created by Eric Liu on 11/12/20.
//

import SwiftUI

struct UserDetail: View {
  let user: User
  let friends: [User]

  var body: some View {
    List {
      Section(header: Text("Basic Info")) {
        Text("\(self.user.age)")
        Text("\(self.user.email)")
      }
      Section(header: Text("Main")) {
        Text("\(self.user.company)")
        Text("\(self.user.about)")
      }
      Section(header: Text("Etc")) {
        Text("\(self.user.address)")
        Text("\(self.user.registered)")
      }
      Section(header: Text("Friends")) {
        ForEach(self.friends, id: \.id) { friend in
          Text("\(friend.name): \(friend.age)")
        }
        
      }
      Section(header: Text("Tags")) {
        let hashtagged = self.user.tags.map { "#\($0)"}.joined(separator: ", ")
        Text("\(hashtagged)")
      }
    }
    .navigationBarTitle("\(self.user.name)")
  }
  
  init(user: User, users: [User]) {
    self.user = user
    var matchingFriends = [User]()
    
    for friend in user.friends {
      if let match = users.first(where: {$0.id == friend.id }) {
        matchingFriends.append(match)
      } else {
        fatalError("Missing \(friend.name)")
      }
    }

    self.friends = matchingFriends
  }
}

struct UserDetail_Previews: PreviewProvider {
  static var previews: some View {
    let user = User(id: "a", isActive: true, name: "eric", age: 30, company: "E-rice", email: "ericliu@gmail.com", address: "Santa Barbara CA 93111", about: "ello", registered: "1234", tags: [], friends: [])
    let users = [user]
    UserDetail(user: user, users: users)
  }
}
