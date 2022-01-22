//
//  Task.swift
//  SDGoalsOnTheGo
//
//  Created by Apple101 on 1/9/22.
//

import Foundation
import Firebase

struct Task: Identifiable {
    var id: String
    var name: String
    var points: Int
    var userID: String
}
