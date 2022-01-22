//
//  ContentView.swift
//  SDGoalsOnTheGo
//
//  Created by Apple101 on 1/9/22.
//

import SwiftUI
import Firebase

struct Tab: View {
    @ObservedObject var model: ImageViewModel
    @ObservedObject var usernameModel: ProfileViewModel
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Tasks()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Tasks")
            }
            Profile(model: model, profilemodel: usernameModel)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
            }
        }
    }
}
