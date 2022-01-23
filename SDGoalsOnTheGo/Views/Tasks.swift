import SwiftUI
import Firebase

struct Tasks: View {
    let userID = Auth.auth().currentUser!.uid
    
    @ObservedObject var model = TaskViewModel()
    @ObservedObject var pointModel = PointViewModel()
    @ObservedObject var countModel = CountViewModel()
    @ObservedObject var badge = BadgeViewModel()
    @State var name = ""
    @State var points = ""
    @State var badgeEarned = false
    @State var amt = 0
    @State var taskAmt = 0
    @State private var fadeInOut = false
    @State private var checked = true
    var body: some View {
        VStack {
            List(model.list) { item in
                
                if item.userID == self.userID {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                            Text(String(item.points))
                                .foregroundColor(Color.gray)
                        }
                        Spacer()
                        Group {
                            if checked {
                                Text("Claimed")
                                    .font(.headline)
                                    .foregroundColor(Color.buttonGreen)
                                    .onAppear() {
                                        withAnimation(Animation.easeInOut(duration: 0.7)) {
                                            fadeInOut.toggle()
                                        }
                                    }.opacity(fadeInOut ? 0 : 1)
                                
                            }
                            
                        }
                        Button(action: {
                            checked.toggle()
                            
                            amt = pointModel.addPoints(adding: item.points)
                            if amt >= 500 {
                                if !badge.badges.contains("point500") {
                                    badge.badges.append("point500")
                                    badgeEarned.toggle()
                                }
                            }
                            if amt >= 200 {
                                if !badge.badges.contains("point200") {
                                    badge.badges.append("point200")
                                    badgeEarned.toggle()
                                }
                            }
                            if amt >= 100 {
                                if !badge.badges.contains("point100") {
                                    badge.badges.append("point100")
                                    badgeEarned.toggle()
                                }
                            }
                            if amt >= 50 {
                                if !badge.badges.contains("point50") {
                                    badge.badges.append("point50")
                                    badgeEarned.toggle()
                                }
                            }
                            taskAmt = countModel.addCount(adding: 1)
                            if taskAmt >= 200 {
                                if !badge.badges.contains("task200") {
                                    badge.badges.append("task200")
                                    badgeEarned.toggle()
                                }
                            }
                            if taskAmt >= 100 {
                                if !badge.badges.contains("task100") {
                                    badge.badges.append("task100")
                                    badgeEarned.toggle()
                                }
                            }
                            if taskAmt >= 50 {
                                if !badge.badges.contains("task50") {
                                    badge.badges.append("task50")
                                    badgeEarned.toggle()
                                }
                            }
                            model.deleteData(toDelete: item)
                        }, label: {
                            Image(systemName: "checkmark")
                                .foregroundColor(Color.buttonGreen)
                        })
                            .buttonStyle(BorderlessButtonStyle())
                            .sheet(isPresented: $badgeEarned) {
                                Badges(model: badge)
                            }

                        Button(action: {
                            model.deleteData(toDelete: item)
                        }, label: {
                            Image(systemName: "minus.circle")
                                .foregroundColor(Color.red)
                        })
                    }
                }
            }
            Divider()
            VStack(spacing: 5) {
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Points", text: $points)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack {
                    Button(action: {
                        model.addData(name: name, points: Int(points) ?? 0, uid: userID)
                        name = ""
                        points = ""
                        checked.toggle()
                    }, label: {
                        Text("Add Task")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.buttonGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    })
                    Button(action: {
                        model.getData()
                        checked.toggle()
                    }, label: {
                        Text("Update")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.buttonGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    })
                }
            }
            .padding()
        }
    }
    
    init() {
        model.getData()
        pointModel.getData()
        countModel.getData()
    }
}

extension Color {
    public static var buttonGreen: Color {
        return Color(UIColor(red: 47/255, green: 158/255, blue: 75/255, alpha: 1.0))
    }
}
