//
//  ContentView.swift
//  SDGoalsOnTheGo
//
//  Created by Apple101 on 1/9/22.
//

import SwiftUI
import Firebase

struct Badges: View {
    @ObservedObject var model: BadgeViewModel
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.backgroundGreen, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.top)
            ScrollView {
                Text("Badges")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .offset(y: 10)
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.white)
                        .frame(width: 375, height: 600)
                    VStack {
                        Text("Point Badges")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                        HStack {
                            Image("point50")
                                .resizable()
                                .frame(width: 85, height: 85)
                            Image("point100")
                                .resizable()
                                .frame(width: 85, height: 85)
                            Image("point200")
                                .resizable()
                                .frame(width: 85, height: 85)
                            Image("point500")
                                .resizable()
                                .frame(width: 85, height: 85)
                        }
                        
                        Text("Task Badges")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                            .offset(y: 10)
                        HStack {
                            HStack {
                                Image("task50")
                                    .resizable()
                                    .frame(width: 85, height: 85)
                                Image("task100")
                                    .resizable()
                                    .frame(width: 85, height: 85)
                                Image("task200")
                                    .resizable()
                                    .frame(width: 85, height: 85)
                            }
                        }
                        .offset(y: 10)
                        Text("Badges Completed")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .offset(y: 25)
                        ImageSlider(model: model)
//                            .frame(width: 175, height: 175)
//                            .offset(y: 35)
                        Spacer()
                    }
                    .offset(y: 50)
                }
            }
        }
    }
}

extension Color {
    public static var backgroundGreen: Color {
        return Color(UIColor(red: 68/255, green: 145/255, blue: 73/255, alpha: 1.0))
    }
}
