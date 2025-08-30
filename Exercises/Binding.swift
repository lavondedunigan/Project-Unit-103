//
//  Binding.swift
//  Project Unit 103
//
//  Created by Lavonde Dunigan on 8/28/25.
//

import SwiftUI
// MARK: -Two Way Binding - $variableName
struct NameView: View {
    @State var name: String = ""
    
    var body: some View {
        Form {
            Text("What is your name")
            
            TextField("Write your name", text: $name)
            
            Text("Your name is \(name)")
        }
        
    }
    
}
// MARK: -Binding Wrapper -> @Binding
/// It is used when you want to have multiple views
/// The child view will access (read and write) the parent variable
///



// Parent View
struct SwitchView: View {
    // Owner of the variable
    @State private var switchStatus = false
    
    var body: some View {
        VStack {
            
            
            // Ternary condition
            Text(switchStatus ? "Switch is On" :  "Switch if off")
            
            //Toggle View -> Child View
            ToggleView(status: $switchStatus)
        }
    }
}

// Child View
struct ToggleView: View {
    
    @Binding var status: Bool
    
    var body: some View {
        Toggle("Switch", isOn: $status)
            .padding()
            
    
    }
}
#Preview {
    //NameView()
    SwitchView()
}

