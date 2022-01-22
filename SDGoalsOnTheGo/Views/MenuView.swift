import SwiftUI

struct MenuView: View {
    @ObservedObject var model = BadgeViewModel()
    var body: some View {

        VStack(alignment: .leading) {
            Spacer()
                .frame(height: 20)
            NavigationLink(destination: Badges(model: model), label: {
                HStack {
                    //add images
                    Image(systemName: "leaf.fill")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    Text("Badges")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding(.top, 130)
            })
            
            NavigationLink(destination: Leaderboard(), label: {
                HStack {
                    Image(systemName: "globe.americas.fill")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    Text("Leaderboard")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding(.top, 30)
            })
            
            NavigationLink(destination: Contact(), label: {
                HStack {
                    Image(systemName: "pencil.circle.fill")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    Text("Suggest")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding(.top, 30)
            })
            
            Spacer()
        }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(red: 92/255, green: 120/255, blue: 81/255))
            .edgesIgnoringSafeArea(.all)
    }
}
