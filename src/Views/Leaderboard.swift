//
//  ContentView.swift
//  SDGoalsOnTheGo
//
//  Created by Apple101 on 1/9/22.
//

import SwiftUI
import Firebase

struct Leaderboard: View {
    var body: some View {
        ScrollView {
            Image("circleLogo")
                .resizable()
                .frame(width: 200, height: 200)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 350, height: 75)
                .foregroundColor(Color.gold)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 350, height: 75)
                .foregroundColor(Color.silver)
                .offset(y: -5)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 350, height: 75)
                .foregroundColor(Color.bronze)
                .offset(y: -10)
            ForEach(0..<20) { i in
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 350, height: 75)
                    .foregroundColor(Color.offWhite)
                    .offset(y: -(CGFloat(15 + i * 5)))
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
}
