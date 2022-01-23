import SwiftUI
import Firebase

struct Goal1: View {
    let userID = Auth.auth().currentUser!.uid
    
    @State var tasks = ["Help at a food bank or shelter", "Donate to charity", "Raise awareness", "Sign a petition", "Finish all your food and drinks"]
    
    @State var points = [20, 20, 10, 10, 5]
    @ObservedObject var model = TaskViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    var body: some View {
        ScrollView {
            VStack {
                Image("povertyLogo")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 160)
                Group {
                    Text("NO POVERTY:")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(Color.red)
                    Text("AN OVERVIEW")
                        .font(.system(size: 50))
                        .foregroundColor(Color.red)
                    Spacer()
                    Text("An Introduction")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Spacer()
                    Text("Everyone knows the general meaning of poverty, it's when an individual is not able to meet their basic needs because of a lack of money. These needs include, shelter, water, and food. There lack of these needs also disables them from being a member in society. In more technical terms, poverty is usually defined as having less than 60% of the average household income.")
                        .font(.system(size: 17))
                        .multilineTextAlignment(.center)
                        .frame(width: 350)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                Group {
                    Text("Causes of Poverty")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    VStack {
                        
                        Spacer()
                        Text("1. Inequality")
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                            .frame(width: 350)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        Text("2. Poor healthcare systems")
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                            .frame(width: 350)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        Text("3. Lack of Education and Government Support")
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                            .frame(width: 350)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        Text("4. Lack of Job Opportunities")
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                            .frame(width: 350)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        Text("5. No Access to Clean Water and Sanitation")
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                            .frame(width: 350)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                    Text("Statistics")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    VStack {
                        Group {
                            Spacer()
                            Text("1. 12.9% of women live in poverty and 10.6% of men live in poverty")
                                .font(.system(size: 17))
                                .multilineTextAlignment(.center)
                                .frame(width: 350)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                            Image("gender")
                                .resizable()
                                .frame(width: 195, height: 98)
                        }
                        Group {
                            Spacer()
                            Text("2. 16.2% of children live in poverty and 9.7% of seniors live in poverty")
                                .font(.system(size: 17))
                                .multilineTextAlignment(.center)
                                .frame(width: 350)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                            HStack {
                                Image("children")
                                    .resizable()
                                    .frame(width: 95, height: 100)
                                Image("seniors")
                                    .resizable()
                                    .frame(width: 90, height: 100)
                            }
                        }
                        Group {
                            Spacer()
                            Text("3. 25.4% of Native Americans, 20.8% of Black, 17.6% of Hispanic, 10.1% of White, and 10.1% of Asians live in poverty")
                                .font(.system(size: 17))
                                .multilineTextAlignment(.center)
                                .frame(width: 350)
                                .fixedSize(horizontal: false, vertical: true)
                            Spacer()
                            Image("ethnicity")
                                .resizable()
                                .frame(width: 400, height: 85)
                        }
                    }
                    Spacer()
                }
                
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
                                .foregroundColor(Color(.red))
                                .padding()
                        }).buttonStyle(PlainButtonStyle())
                    }
                }.frame(minHeight: minRowHeight * 9)
                Group {
                    Text("Learn more")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Spacer()
                    Link("https://www.un.org/sustainabledevelopment/poverty/", destination: URL(string: "https://www.un.org/sustainabledevelopment/poverty/")!)
                        .font(.system(size: 17))
                    Spacer()
                    Link("https://ourworldindata.org/extreme-poverty", destination: URL(string: "https://ourworldindata.org/extreme-poverty")!)
                        .font(.system(size: 17))
                    Spacer()
                    Link("https://www.povertyusa.org/facts", destination: URL(string: "https://www.povertyusa.org/facts")!)
                        .font(.system(size: 17))
                }
            }
        }
    }
}
