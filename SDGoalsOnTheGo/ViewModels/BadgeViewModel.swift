//
//  TaskViewModel.swift
//  SDGoalsOnTheGo
//
//  Created by Apple101 on 1/15/22.
//

import Foundation
import Firebase

class BadgeViewModel: ObservableObject {
    let userID = Auth.auth().currentUser!.uid
    @Published var badges = [String]()
    
}
