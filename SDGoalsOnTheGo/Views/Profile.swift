import SwiftUI
import Firebase

struct Profile: View {

    @ObservedObject var model: ImageViewModel
    @ObservedObject var profilemodel: ProfileViewModel
    @State var image = ""
    @State var username = ""
    
    @State var points = 0
    @State var tasks = 0
    @State var badges = 0
    var body: some View {

        ScrollView {
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color(red: 245/255, green: 245/255, blue: 245/255))
                    .frame(width: 350, height: 250)
                VStack {
                    HStack {
                        Spacer()
                        AsyncImage(url: URL(string: model.imageUrl)) { image in
                            image
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(50)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 128, height: 128)
                        }
                        Spacer()
                        Text(username)
                            .fontWeight(.bold)
                            .font(.headline)
                            .offset(y: -25)
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            Text(String(points))
                                .fontWeight(.bold)
                            Text("Points")
                                .font(.system(size: 13))
                                .foregroundColor(Color.gray)
                        }
                        Spacer()
                        VStack {
                            Text(String(tasks))
                                .fontWeight(.bold)
                            Text("Tasks")
                                .font(.system(size: 13))
                                .foregroundColor(Color.gray)
                        }
                        Spacer()
                        VStack {
                            Text("0")
                                .fontWeight(.bold)
                            Text("Badges")
                                .font(.system(size: 13))
                                .foregroundColor(Color.gray)
                        }
                        Spacer()
                    }.offset(y: 25)
                        
                }
            }
            Spacer()
            
        }.onAppear {
            username = profilemodel.getUsername()
            points = profilemodel.getPoints()
            tasks = profilemodel.getTasks()
        }
    }
    
}

func getUsername(userID: String) -> String {
    let db = Firestore.firestore()
    var users = [Int]()
    var username = ""
    
    db.collection("users").getDocuments { snapshot, error in
        if error == nil {
            if let snapshot = snapshot {
                users = snapshot.documents.map { d in
                    if d["uid"] as! String == userID {
                        username = d["email"] as! String
                    }
                    return 0
                }
              
            }
        
        }
    }
    return username
}


