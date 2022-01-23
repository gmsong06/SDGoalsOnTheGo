import SwiftUI
import Firebase

struct Goal3: View {
    let userID = Auth.auth().currentUser!.uid
    
    @State var tasks = ["Eat healthy", "Exercise 20-60 minutes today", "Destress during the day", "Sleep an hour earlier tonight", "Frequently drink water"]
    
    @State var points = [20, 20, 10, 5, 5]
    @ObservedObject var model = TaskViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    var body: some View {
        ScrollView {
            VStack {
                Image("goodhealthandwellbeingLogo")
                    .resizable()
                    .frame(width: 150)
                    .frame(height: 150)
                Group {
                    Text("GOOD HEALTH:")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 85/255, green: 178/255, blue: 91/255))
                    Text("AN OVERVIEW")
                        .font(.system(size: 50))
                        .foregroundColor(Color(red: 85/255, green: 178/255, blue: 91/255))
                    Spacer()
                    Text("An Introduction")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Spacer()
                    Text("Health is one of the most important aspects of living a heathly life. Quality healthcare is a thing people sometimes take for granted. Healthcare is not something that everyone has and it's not something that everyone as the power to get. In this page there will be tasks that people can do outside of having good healthcare, such as exercising and eating healthy.")
                        .font(.system(size: 17))
                        .multilineTextAlignment(.center)
                        .frame(width: 350)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                Group {
                    Text("Covid-19 Statistics")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    VStack {
                        Group {
                            Spacer()
                            Text("1. Over 2900 healthcare workers have died since the start of the pandemic")
                                .font(.system(size: 17))
                                .multilineTextAlignment(.center)
                                .frame(width: 350)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        Group {
                            Spacer()
                            Text("2. 28 million surgical procedures have been postponed or canceled because of the pandemic")
                                .font(.system(size: 17))
                                .multilineTextAlignment(.center)
                                .frame(width: 350)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        Group {
                            Spacer()
                            Text("3. Only 18.1% of Americans were convered by Medicare in 2019")
                                .font(.system(size: 17))
                                .multilineTextAlignment(.center)
                                .frame(width: 350)
                                .fixedSize(horizontal: false, vertical: true)
                            Image("goodhealthlogo")
                                .resizable()
                                .frame(width: 375, height: 300)
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
                                .foregroundColor(Color(red: 85/255, green: 178/255, blue: 91/255))
                                .padding()
                        }).buttonStyle(PlainButtonStyle())
                    }
                }.frame(minHeight: minRowHeight * 9)
                Group {
                    Text("Learn more")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Spacer()
                    Link("https://www.ama-assn.org/about/research/trends-health-care-spending", destination: URL(string: "https://www.ama-assn.org/about/research/trends-health-care-spending")!)
                        .font(.system(size: 17))
                    Spacer()
                    Link("https://medalerthelp.org/blog/healthcare-statistics/", destination: URL(string: "https://medalerthelp.org/blog/healthcare-statistics/")!)
                        .font(.system(size: 17))
                    Spacer()
                    Link("https://medlineplus.gov/healthstatistics.html", destination: URL(string: "https://medlineplus.gov/healthstatistics.html")!)
                        .font(.system(size: 17))
                }
                    
            }
        }
    }
    init() {
        model.getData()
    }
}

