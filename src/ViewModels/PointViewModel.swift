//
//  TaskViewModel.swift
//  SDGoalsOnTheGo
//
//  Created by Apple101 on 1/15/22.
//

import Foundation
import Firebase

class PointViewModel: ObservableObject {
    @Published var totalPoints = [Points]()
    let userID = Auth.auth().currentUser!.uid
    
    func addPoints(adding: Int) -> Int{
        let db = Firestore.firestore()
        var index = 0
        for i in 0..<totalPoints.count {
            if totalPoints[i].userID == userID {
                index = i
            }
        }
        totalPoints[index].points = totalPoints[index].points + adding
        var amt = totalPoints[index].points
        db.collection("totalPoints").document(totalPoints[index].id).delete { error in
            if error == nil {
                DispatchQueue.main.async {
                    self.totalPoints.removeAll { point in
                        return self.userID == self.totalPoints[index].userID
                    }
                }
            }

        }

        db.collection("totalPoints").addDocument(data: ["points": amt, "userID": userID]) { error in
            if error == nil {
                self.getData()
            }
            else {
                return
            }
        }
        return amt
    }
    
    func getData() {
        let db = Firestore.firestore()
        
        db.collection("totalPoints").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async { [self] in
                        self.totalPoints = snapshot.documents.map { d in
                            return Points(id: d.documentID, points: d["points"] as? Int ?? 0, userID: d["userID"] as? String ?? "")
                        }
                    }
                }
            }
            else {
                return
            }
        }
    }
}
