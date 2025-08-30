//
//  ObservableObject.swift
//  Project Unit 103
//
//  Created by Lavonde Dunigan on 8/28/25.
//

import SwiftUI


// Model -> ObservableObject
class UserModel: ObservableObject {
    @Published var name: String = "LaVonde Dunigan"
    @Published var age: Int = 57
}


struct MainView: View {
    
    @StateObject private var userModel = UserModel()
    @StateObject private var userModelTwo = UserModel()
    
    var body: some View {
        ProfileView(user: userModel)
        
        ProfileView(user: userModel)
        
        EditProfileView(user: userModel)
    }
}

// ProfileView
struct ProfileView: View {
    
    @ObservedObject var user: UserModel
    
    var body: some View {
        
    

        VStack {
            Text("User Profile")
                .font(.headline)
            
            Text("Name: \(user.name)")
            Text("Age: \(user.age)")
            
        }
        .padding()
        .background(Color.blue.opacity(0.5))
    }
}

// EditProfileView
struct EditProfileView: View {
    
    @ObservedObject var user: UserModel
    
    var body: some View {
        VStack{
            
            
            Text("Edit Profile")
                .font(.headline)
            
            TextField("Enter your name", text: $user.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Stepper("Age: \(user.age)", value: $user.age, in: 0...100)
                .padding()
        }
        
    }
}





#Preview{
    MainView()
}
