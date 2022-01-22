//
//  TaskViewModel.swift
//  SDGoalsOnTheGo
//
//  Created by Apple101 on 1/15/22.
//

import Foundation
import Firebase

class CountViewModel: ObservableObject {
    @Published var count = [Count]()
    let userID = Auth.auth().currentUser!.uid
    
    func addCount(adding: Int) -> Int{
        let db = Firestore.firestore()
        var index = 0
        for i in 0..<count.count {
            if count[i].userID == userID {
                index = i
            }
        }

        count[index].count = count[index].count + adding
        var amt = count[index].count
        
        db.collection("count").document(count[index].id).delete { error in
            if error == nil {
                DispatchQueue.main.async {
                    self.count.removeAll { count in
                        return self.userID == self.count[index].userID
                    }
                }
            }
        }
        
        db.collection("count").addDocument(data: ["count": amt, "userID": userID]) { error in
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
        
        db.collection("count").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async { [self] in
                        self.count = snapshot.documents.map { d in
                            return Count(id: d.documentID, count: d["count"] as? Int ?? 0, userID: d["userID"] as? String ?? "")
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
