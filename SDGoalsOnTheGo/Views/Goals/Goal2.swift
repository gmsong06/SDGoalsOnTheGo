import SwiftUI
import Firebase

struct Goal2: View {
    let userID = Auth.auth().currentUser!.uid
    
    @State var tasks = ["Volunteer at a food pantry", "Read about hunger in the world", "Plant a garden", "Donate food to food pantries", "Spread awareness"]
    
    @State var points = [30, 10, 30, 30, 10]
    @ObservedObject var model = TaskViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    var body: some View {
        ScrollView {
            VStack {
                Image("zerohungerLogo")
                    .resizable()
                    .frame(width: 150)
                    .frame(height: 150)
                Group {
                    Text("ZERO HUNGER:")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 218/255, green: 172/255, blue: 75/255))
                    Text("AN OVERVIEW")
                        .font(.system(size: 50))
                        .foregroundColor(Color(red: 218/255, green: 172/255, blue: 75/255))
                    Spacer()
                    Text("An Introduction")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Spacer()
                    Text("Food. Everyone's favorite. Unfortunately, there are people in the world who suffer from hunger due to poverty. Due to the pandemic, food insecurity among families with children as well as communities of color have increased. The second UN Sustainable Development Goal aims to stop hunger and food insecurities in the world.")
                        .font(.system(size: 17))
                        .multilineTextAlignment(.center)
                        .frame(width: 350)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                Group {
                    Text("Causes of Hunger")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    VStack {
                        
                        Spacer()
                        Text("1. Poverty")
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                            .frame(width: 350)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        Text("2. Lack of High Paying Jobs")
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                            .frame(width: 350)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        Text("3. Food Shortages and Waste")
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                            .frame(width: 350)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        Text("4. Unstable Markets")
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                            .frame(width: 350)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                        Text("5. War")
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
                            Text("1. 38 million people, including 12 million children are food insecure")
                                .font(.system(size: 17))
                                .multilineTextAlignment(.center)
                                .frame(width: 350)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        Group {
                            Spacer()
                            Text("2. 10.5% of households in the US are food insecure")
                                .font(.system(size: 17))
                                .multilineTextAlignment(.center)
                                .frame(width: 350)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        Group {
                            Spacer()
                            Text("3. Food insecurity is more prevalent in certain parts of the US")
                                .font(.system(size: 17))
                                .multilineTextAlignment(.center)
                                .frame(width: 350)
                                .fixedSize(horizontal: false, vertical: true)
                            Image("foodinsecuritiesmap")
                                .resizable()
                                .frame(width: 200, height: 180)
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
                                .foregroundColor(Color(red: 218/255, green: 172/255, blue: 75/255))
                                .padding()
                        }).buttonStyle(PlainButtonStyle())
                    }
                }.frame(minHeight: minRowHeight * 9)
                Group {
                    Text("Learn more")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Spacer()
                    Link("https://www.ers.usda.gov/topics/food-nutrition-assistance/food-security-in-the-u-s/key-statistics-graphics/", destination: URL(string: "https://www.ers.usda.gov/topics/food-nutrition-assistance/food-security-in-the-u-s/key-statistics-graphics/")!)
                        .font(.system(size: 17))
                    Spacer()
                    Link("https://www.feedingamerica.org/hunger-in-america", destination: URL(string: "https://www.feedingamerica.org/hunger-in-america")!)
                        .font(.system(size: 17))
                    Spacer()
                    Link("https://www.actionagainsthunger.org/world-hunger-facts-statistics", destination: URL(string: "https://www.actionagainsthunger.org/world-hunger-facts-statistics")!)
                        .font(.system(size: 17))
                }
                    
            }
        }
    }
}
