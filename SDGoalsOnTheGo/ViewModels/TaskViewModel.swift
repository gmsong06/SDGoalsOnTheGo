//
//  TaskViewModel.swift
//  SDGoalsOnTheGo
//
//  Created by Apple101 on 1/15/22.
//

import Foundation
import Firebase

class TaskViewModel: ObservableObject {
    @Published var list = [Task]()
    let userID = Auth.auth().currentUser!.uid
    
    func deleteData(toDelete: Task) {
        let db = Firestore.firestore()
        
        db.collection("tasks").document(toDelete.id).delete { error in
            if error == nil {
                
                DispatchQueue.main.async {
                    self.list.removeAll { task in
                        return task.id == toDelete.id
                    }
                }
            }
        }
    }
    func addData(name: String, points: Int, uid: String) {
        let db = Firestore.firestore()
        
        db.collection("tasks").addDocument(data: ["name": name, "points": points, "userID": userID]) { error in
            if error == nil {
                self.getData()
            }
            else {
                return
            }
        }
    }
    func getData() {
        let db = Firestore.firestore()
        
        db.collection("tasks").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async { [self] in
                        self.list = snapshot.documents.map { d in
                            return Task(id: d.documentID, name: d["name"] as? String ?? "", points: d["points"] as! Int, userID: d["userID"] as? String ?? "")
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
