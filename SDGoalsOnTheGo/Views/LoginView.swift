import SwiftUI
import Firebase


struct LoginView: View {
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    @State var errorMessage = ""
    @State var shouldShowImagePicker = false;
    @State var image: UIImage?
    @State var loggedIn = false
    @ObservedObject var model = ImageViewModel()
    @ObservedObject var usernameModel = ProfileViewModel()
    
    @State var url = URL(string: "")
    @State var images = [Int]()
    @State var isLoading = false
    @State var timeDone = false
    var body: some View {
        NavigationView {
            if loggedIn {
                Tab(model: model, usernameModel: usernameModel)
            }
            
            ScrollView {
                VStack(spacing: 16) {
                    Picker(selection: $isLoginMode) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    } label: {
                        Text("Picker here")
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    if !isLoginMode {
                        Button(action: {
                            shouldShowImagePicker.toggle()
                        }, label: {
                            VStack {
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 128, height: 128)
                                        .cornerRadius(64)
                                        
                                }
                                else {
                                    Image(systemName: "person.fill")
                                        .font(.system(size: 64))
                                        .padding()
                                        .foregroundColor(Color(.label))
                                }
                            }
                        })
                            .overlay(RoundedRectangle(cornerRadius: 64).stroke(Color.black, lineWidth: 3))
                    }
                    else {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 128, height: 128)
                    }
                    Group {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                        SecureField("Password", text: $password)
                    }
                    .padding(12)
                    .background(Color.white)
                    
                    Button {
                        handleAction(email: email)
                        startNetworkCall()
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Login" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                        }.background(Color.buttonGreen)
                    }
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .buttonGreen))
                            .scaleEffect(3)
                            .offset(y: -125)
                    }
                    if timeDone {
                        Text("Successfully created account")
                            .font(.headline)
                            .foregroundColor(Color.buttonGreen)
                    }
                }
                .padding()
                
            }
            .navigationTitle(isLoginMode ? "Login" : "Create Acount")
            .background(Color(.init(white: 0, alpha: 0.05)).ignoresSafeArea())
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
        }
        .accentColor(.black)
    }
    private func startNetworkCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            isLoading = false
            timeDone = true
        }
    }
    private func handleAction(email: String) {
        if isLoginMode {
            loginUser(email: email)
        }
        else {
            createNewAccount()
        }
    }
    
    private func persistImageToStorage() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            return
        }
        
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
        let db = Firestore.firestore()
        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else {
            return
        }
        ref.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                self.errorMessage = "Failed to push image to Storage: \(error)"
                return
            }
            ref.downloadURL { url, error in
                if let error = error {
                    self.errorMessage = "Failed to retrieve downloadURL: \(error)"
                    return
                }
                self.errorMessage = "Successfully stored image with url \(url?.absoluteString ?? "")"
                
                guard let url = url else {
                    return
                }
                
                self.storeUserInformation(imageProfileUrl: url)
                self.url = url
                db.collection("images").addDocument(data: ["url": url.absoluteString, "userID": uid]) { err in
                    if err != nil {
                        return
                    }
                }
            }
        }
    }
    
    private func storeUserInformation(imageProfileUrl: URL) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            return
        }
        let userData = ["email": self.email, "uid": uid, "profileImageUrl": imageProfileUrl.absoluteString]
        FirebaseManager.shared.firestore.collection("users")
            .document(uid).setData(userData) { error in
                if let error = error {
                    self.errorMessage = "\(error)"
                }
                print("Success")
            }
        let db = Firestore.firestore()
        db.collection("totalPoints").addDocument(data: ["points": 0, "userID": uid])
        db.collection("count").addDocument(data: ["count": 0, "userID": uid])
    }
    private func createNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("failed to create user: ", error)
                self.errorMessage = "Failed to create user: \(error)"
                return
            }
            
            print("Successfully created user: \(result?.user.uid ?? "") ")
            self.errorMessage = "Successfully created user: \(result?.user.uid ?? "")"
            
            self.persistImageToStorage()
        }
    }
    
    private func loginUser(email: String) {
        
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("failed to login user: ", error)
                self.errorMessage = "Failed to login user: \(error)"
                return
            }
            self.errorMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
            loggedIn = true
        }
        let db = Firestore.firestore()
        db.collection("images").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    self.images = snapshot.documents.map { d in
                        if d["userID"] as! String == FirebaseManager.shared.auth.currentUser?.uid {
                            model.imageUrl = d["url"] as! String
                        }
                        return 0
                    }
                }
            }
            else {
                return
            }
        }
        usernameModel.email = email
    }
}
