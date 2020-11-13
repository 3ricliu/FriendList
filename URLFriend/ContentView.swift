//
//  ContentView.swift
//  URLFriend
//
//  Created by Eric Liu on 11/11/20.
//

import SwiftUI

struct ContentView: View {
  @State private var users = [User]()

  var body: some View {
    NavigationView {
      List(users, id: \.id) { user in
        NavigationLink(destination: UserDetail(user: user, users: users)) {
          Text("\(user.name)")
        }
      }
      .navigationBarTitle("Frands")
    }
    .onAppear(perform: loadData)
  }

  func loadData() {
    guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
      print("Invalid URL")
      return
    }
    
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
      if let data = data {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        if let decodedResponse = try? decoder.decode([User].self, from: data) {
          DispatchQueue.main.async {
            self.users = decodedResponse
          }
          
          return
        }
      }
      
      print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
    }.resume()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
