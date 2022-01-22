import SwiftUI
import Firebase

struct Goal12: View {
    let userID = Auth.auth().currentUser!.uid
    
    @State var tasks = ["Help at a food bank or shelter", "Donate to charity", "Raise awareness", "Sign a petition", "Finish all your food and drinks"]
    
    @State var points = [20, 20, 10, 10, 5]
    @ObservedObject var model = TaskViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image("responsibleconsumptionandproductionLogo")
                        .resizable()
                        .frame(width: 150)
                        .frame(height: 150)
                    Group {
                        Text("RESPONSIBLE CONSUMPTION AND PRODUCTION: ")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 189/255, green: 147/255, blue: 61/255))
                        Text("AN OVERVIEW")
                            .font(.system(size: 50))
                            .foregroundColor(Color(red: 189/255, green: 147/255, blue: 61/255))
                        Spacer()
                        Text("An Introduction")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        Text("stuff")
                            .font(.system(size: 20))
                        Spacer()
                    }
                    Group {
                        Text("Causes of Poverty")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        Text("stuff")
                            .font(.system(size: 20))
                        Spacer()
                        Text("Quick Facts")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        Text("stuff")
                            .font(.system(size: 20))
                    }
                    Spacer()
                    List(0..<5) { i in
                        HStack {
                            
                            VStack(alignment: .leading) {
                                Text(tasks[i])
                                Text(String(points[i]))
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray)
                            }
                            Spacer()
                            Button(action: {
                                model.addData(name: tasks[i], points: Int(points[i]) ?? 0, uid: userID)
                            }, label: {
                                Text("ADD")
                                    .foregroundColor(Color(red: 189/255, green: 147/255, blue: 61/255))
                                    .padding()
                            }).buttonStyle(PlainButtonStyle())
                        }
                    }

                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                    
            }
        }
    }
    init() {
        model.getData()
    }
}
