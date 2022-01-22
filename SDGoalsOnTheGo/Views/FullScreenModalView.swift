import SwiftUI

struct FullScreenModalView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var model: BadgeViewModel
    @State var showMenu = false
    var body: some View {
        VStack {
            Text("Badge Earned!")
                .font(.title)
            Button(action: {
                showMenu.toggle()
            }, label: {
                Text("Check Badges")
                    .font(.headline)
            })
            Button("Close") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
