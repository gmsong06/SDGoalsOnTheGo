//
//  ContentView.swift
//  SDGoalsOnTheGo
//
//  Created by Apple101 on 1/9/22.
//

import SwiftUI
import Firebase

struct Leaderboard: View {
    @State var pointMode = false
    var body: some View {
        ScrollView {
            Picker(selection: $pointMode) {
                Text("Points")
                    .tag(true)
                Text("Tasks")
                    .tag(false)
            } label: {
                Text("Picker here")
            }.pickerStyle(SegmentedPickerStyle())
            Image("circleLogo")
                .resizable()
                .frame(width: 200, height: 200)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 350, height: 75)
                    .foregroundColor(Color.gold)
                HStack {
                    Image(systemName: "person.fill")
                        .font(.system(size: 32))
                        .padding()
                        .foregroundColor(Color.darkGray)
                        //.overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.black, lineWidth: 2))
                        .offset(x: 30)
                    Text("User 1")
                        .font(.headline)
                        .foregroundColor(Color.darkGray)
                        .offset(x: 40)
                    Spacer()
                    if pointMode {
                        Text("500")
                            .font(.headline)
                            .foregroundColor(Color.darkGray)
                            .offset(x: 65)
                    }
                    else {
                        Text("200")
                            .font(.headline)
                            .foregroundColor(Color.darkGray)
                            .offset(x: 65)
                    }
                    Spacer()
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 350, height: 75)
                    .foregroundColor(Color.silver)
                    .offset(y: -5)
                HStack {
                    Image(systemName: "person.fill")
                        .font(.system(size: 32))
                        .padding()
                        .foregroundColor(Color.darkGray)
                        //.overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.black, lineWidth: 2))
                        .offset(x: 30)
                    Text("User 2")
                        .font(.headline)
                        .foregroundColor(Color.darkGray)
                        .offset(x: 40)
                    Spacer()
                    if pointMode {
                        Text("200")
                            .font(.headline)
                            .foregroundColor(Color.darkGray)
                            .offset(x: 65)
                    }
                    else {
                        Text("100")
                            .font(.headline)
                            .foregroundColor(Color.darkGray)
                            .offset(x: 65)
                    }
                    Spacer()
                }
                .offset(y: -5)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 350, height: 75)
                    .foregroundColor(Color.bronze)
                    .offset(y: -10)
                HStack {
                    Image(systemName: "person.fill")
                        .font(.system(size: 32))
                        .padding()
                        .foregroundColor(Color.darkGray)
                        //.overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.black, lineWidth: 2))
                        .offset(x: 30)
                    Text("User 3")
                        .font(.headline)
                        .foregroundColor(Color.darkGray)
                        .offset(x: 40)
                    Spacer()
                    if pointMode {
                        Text("100")
                            .font(.headline)
                            .foregroundColor(Color.darkGray)
                            .offset(x: 65)
                    }
                    else {
                        Text("50")
                            .font(.headline)
                            .foregroundColor(Color.darkGray)
                            .offset(x: 65)
                    }
                    Spacer()
                }
                .offset(y: -10)
            }
            ForEach(0..<20) { i in
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 350, height: 75)
                        .foregroundColor(Color.offWhite)
                        .offset(y: -(CGFloat(15 + i * 5)))
                    HStack {
                        Image(systemName: "person.fill")
                            .font(.system(size: 32))
                            .padding()
                            .foregroundColor(Color.darkGray)
                            //.overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.black, lineWidth: 2))
                            .offset(x: 30)
                        Text("User " + String(i + 4))
                            .font(.headline)
                            .foregroundColor(Color.darkGray)
                            .offset(x: 40)
                        Spacer()
                        if pointMode {
                            Text("50")
                                .font(.headline)
                                .foregroundColor(Color.darkGray)
                                .offset(x: 65)
                        }
                        else {
                            Text("10")
                                .font(.headline)
                                .foregroundColor(Color.darkGray)
                                .offset(x: 65)
                        }
                        Spacer()
                    }
                    .offset(y: -(CGFloat(15 + i * 5)))
                }
            }
            
        }
        .navigationTitle("Leaderboard")
    }
}

extension Color {
    public static var gold: Color {
        return Color(red: 242/255, green: 202/255, blue: 41/255)
    }
    public static var silver: Color {
        return Color(red: 168/255, green: 168/255, blue: 168/255)
    }
    public static var bronze: Color {
        return Color(red: 194/255, green: 118/255, blue: 19/255)
    }
    public static var offWhite: Color {
        return Color(red: 237/255, green: 237/255, blue: 237/255)
    }
    public static var darkGray: Color {
        return Color(red: 50/255, green: 50/255, blue: 50/255)
    }
}
