import SwiftUI

struct ImageSlider: View {
    @ObservedObject var model: BadgeViewModel
    var body: some View {
        TabView {
            ForEach(removeDupes(array: model.badges), id: \.self) { item in
                Image(item)
                    .resizable()
                    .frame(width: 175, height: 175)
            }
            if model.badges.count == 0 {
                Image("logo")
                    .resizable()
                    .frame(width: 175, height: 175)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

func removeDupes(array: [String]) -> [String]{
    var ans = [String]()
    for i in array {
        if !ans.contains(i) {
            ans.append(i)
        }
    }
    return ans
}
