//
//  UserDetail.swift
//  URLFriend
//
//  Created by Eric Liu on 11/12/20.
//

import SwiftUI

struct UserDetail: View {
  var user: User

  var body: some View {
    List {
      Section(header: Text("Basic Info:")) {
        Text("\(self.user.age)")
        Text("\(self.user.email)")
      }
      Section(header: Text("Main:")) {
        Text("\(self.user.company)")
        Text("\(self.user.about)")
      }
      Section(header: Text("Etc:")) {
        Text("\(self.user.address)")
        Text("\(self.user.registered)")
      }
    }
    .navigationBarTitle("\(self.user.name)")
  }
}

struct UserDetail_Previews: PreviewProvider {
  static var previews: some View {
    let user = User(id: "a", isActive: true, name: "eric", age: 30, company: "E-rice", email: "ericliu@gmail.com", address: "Santa Barbara CA 93111", about: "ello", registered: "1234", tags: [], friends: [])
    UserDetail(user: user)
  }
}
