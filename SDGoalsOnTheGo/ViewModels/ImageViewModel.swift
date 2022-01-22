//
//  ImageViewModel.swift
//  SDGoalsOnTheGo
//
//  Created by Apple101 on 1/16/22.
//

import Foundation
import Firebase

class ImageViewModel: ObservableObject {
    @Published var imageUrl = ""
    @Published var email = ""
    func getImageUrl(url: URL) {
        DispatchQueue.main.async {
            self.imageUrl = url.absoluteString
            print("Image url is " + self.imageUrl)
        }
    }
}
