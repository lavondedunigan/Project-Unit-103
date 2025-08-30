//
//  Shopping List.swift
//  Project Unit 103
//
//  Created by Lavonde Dunigan on 8/28/25.
//

import SwiftUI

struct Shopping_List: View {
    @State private var shoppingItems: [String] = ["Eggs", "Apples", "Bacon"]
    @State private var newItemName: String = "" // For adding new items
    
    var body: some View {
        NavigationView {
            // Input field for new items
            HStack {
                TextField("Add new item", text: $newItemName)
                Button("Add") {
                    if !newItemName.isEmpty {
                        shoppingItems.append(newItemName)
                        newItemName = "" // Clear the input field
                    }
                }
            }
            
            List{
                ForEach(shoppingItems, id: \.self){  Item in Text(Item)
                }
                // Display shopping items
                
                // Enable swipe-to-delete
                //.onDelete(perform: deleteItems)
            }
            .navigationTitle("Shopping List")
            
            
            }
        }
    }

#Preview {
    Shopping_List()
}
