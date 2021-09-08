//
//  MainView.swift
//  MainView
//
//  Created by Владимир on 06.09.2021.
//

import SwiftUI
import Combine
struct MainView: View {
  @State var showingLogin = true
  let signInPublisher = NotificationCenter.default
    .publisher(for: .signInNotification)
    .receive(on: RunLoop.main)
  let signOutPublisher = NotificationCenter.default
    .publisher(for: .signOutNotification)
    .receive(on: RunLoop.main)
  
  var body: some View {
    TabView {
      FeedView()
        .tabItem {
          Image("home")
          Text("Home")
        }.tag(0)
      Text("Tab Content 2")
        .tabItem {
          Image("photo")
          Text("Post")
        }.tag(1)
      Text("Tab Content 3")
        .tabItem {
          Image("profile")
          Text("Profile")
        }.tag(2)
    }
    .accentColor(.accentGreen)
    .fullScreenCover(isPresented: $showingLogin) {
      LoginSignupView()
    }
    .onReceive(signInPublisher) { _ in
      showingLogin = false
    }
    .onReceive(signOutPublisher) { _ in
      showingLogin = true
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
