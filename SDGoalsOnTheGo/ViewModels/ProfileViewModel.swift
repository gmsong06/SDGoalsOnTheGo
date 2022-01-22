//
//  ImageViewModel.swift
//  SDGoalsOnTheGo
//
//  Created by Apple101 on 1/16/22.
//

import Foundation
import Firebase

class ProfileViewModel: ObservableObject {
    @Published var email = ""
    @Published var points = 0
    @Published var tasks = 0
    func getUsername() -> String {
        var result = email.split(separator: "@")
        return String(result[0])
    }
    
    func getPoints() -> Int{
        let db = Firestore.firestore()
        db.collection("totalPoints").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        snapshot.documents.forEach { d in
                            if d["userID"] as! String == Auth.auth().currentUser!.uid {
                                self.points = d["points"] as! Int
                            }
                        }
                    }
                }
            }
        }
        return self.points
    }
    
    func getTasks() -> Int{
        let db = Firestore.firestore()
        db.collection("count").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        snapshot.documents.forEach { d in
                            if d["userID"] as! String == Auth.auth().currentUser!.uid {
                                self.tasks = d["count"] as! Int
                            }
                        }
                    }
                }
            }
        }
        return self.tasks
    }
}
