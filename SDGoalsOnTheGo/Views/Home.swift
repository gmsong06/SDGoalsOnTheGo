import SwiftUI
import Firebase

struct Home: View {
    @State var showMenu = false
    var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    MainView(showMenu: self.$showMenu)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width/2)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
            }
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarItems(leading: (
                Button(action: {
                    withAnimation {
                        self.showMenu.toggle()
                    }
                }, label: {
                    if(showMenu) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                    else {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                })
            ))
        }
        
    }
}

struct MainView: View {
    @Binding var showMenu: Bool
    @State var index = [1, 3, 5, 7, 9, 11, 13, 15]
    @State private var isEditing = false
    
    var body: some View {
        ScrollView {
            Spacer()
            Image("SDGoalsLogo")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 325)
            Group {
                HStack {
                    NavigationLink(destination: {
                        Goal1()
                    }, label: {
                        Image("Goal1")
                            .resizable()
                            .frame(width: 175, height: 175)
                    })
                    NavigationLink(destination: {
                        Goal2()
                    }, label: {
                        Image("Goal2")
                            .resizable()
                            .frame(width: 175, height: 175)
                    })
                }
                HStack {
                    NavigationLink(destination: {
                        Goal3()
                    }, label: {
                        Image("Goal3")
                            .resizable()
                            .frame(width: 175, height: 175)
                    })
                    NavigationLink(destination: {
                        Goal4()
                    }, label: {
                        Image("Goal4")
                            .resizable()
                            .frame(width: 175, height: 175)
                    })
                }
                HStack {
                    NavigationLink(destination: {
                        Goal5()
                    }, label: {
                        Image("Goal5")
                            .resizable()
                            .frame(width: 175, height: 175)
                    })
                    NavigationLink(destination: {
                        Goal6()
                    }, label: {
                        Image("Goal6")
                            .resizable()
                            .frame(width: 175, height: 175)
                    })
                }
                HStack {
                    NavigationLink(destination: {
                        Goal7()
                    }, label: {
                        Image("Goal7")
                            .resizable()
                            .frame(width: 175, height: 175)
                    })
                    NavigationLink(destination: {
                        Goal8()
                    }, label: {
                        Image("Goal8")
                            .resizable()
                            .frame(width: 175, height: 175)
                    })
                }
                HStack {
                    NavigationLink(destination: {
                        Goal9()
                    }, label: {
                        Image("Goal9")
                            .resizable()
                            .frame(width: 175, height: 175)
                    })
                    NavigationLink(destination: {
                        Goal10()
                    }, label: {
                        Image("Goal10")
                            .resizable()
                            .frame(width: 175, height: 175)
                    })
                }
                HStack {
                    NavigationLink(destination: {
                        Goal11()
                    }, label: {
                        Image("Goal11")
                            .resizable()
                            .frame(width: 175, height: 175)
                    })
                    NavigationLink(destination: {
                        Goal12()
                    }, label: {
                        Image("Goal12")
                            .resizable()
                            .frame(width: 175, height: 175)
                    })
                }
                HStack {
                    NavigationLink(destination: {
                        Goal13()
                    }, label: {
                        Image("Goal13")
                            .resizable()
                            .frame(width: 175, height: 175)
                    })
                    NavigationLink(destination: {
                        Goal14()
                    }, label: {
                        Image("Goal14")
                            .resizable()
                            .frame(width: 175, height: 175)
                    })
                }
                HStack {
                    NavigationLink(destination: {
                        Goal15()
                    }, label: {
                        Image("Goal15")
                            .resizable()
                            .frame(width: 175, height: 175)
                    })
                    NavigationLink(destination: {
                        Goal16()
                    }, label: {
                        Image("Goal16")
                            .resizable()
                            .frame(width: 175, height: 175)
                    })
                }
                NavigationLink(destination: {
                    Goal17()
                }, label: {
                    Image("Goal17")
                        .resizable()
                        .frame(width: 175, height: 175)
                })
            }
        }
        //.background(Color(red: 247/255, green: 255/255, blue: 242/255))
    }
}
