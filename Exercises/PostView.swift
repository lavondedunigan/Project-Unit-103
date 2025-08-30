//
//  PostView.swift
//  Project Unit 103
//
//  Created by Lavonde Dunigan on 8/28/25.
//

import SwiftUI

// MARK: -ObservableObject

class PostModel: ObservableObject {
    //Attributes that can be modified
    @Published var likeCount: Int
    @Published var caption: String
    
    // Attributes that won't be modified
    let imageName: String
    let date: String
    
    init(caption: String, imageName: String, date: String, likeCount : Int = 0) {
        self.caption = caption
        self.imageName = imageName
        self.date = date
        self.likeCount = likeCount
    }
}

struct PostView: View {
    @State private var isLike = false
    
    @ObservedObject var post: PostModel
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "person.circle")
                    .imageScale(.large)
                
                Text("my.username")
            }
            
            Image(post.imageName)
                .resizable()
                .aspectRatio(2/3, contentMode: .fill)
                .frame(width: .infinity)
            
            HStack {
                LikeButton(isLike: $isLike)
                
                Text("\(post.likeCount)")
                    .padding(.leading)
            }
            
            Text(post.caption)
                .font(.headline)
            
            Text(post.date)
        
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .padding()
        .onChange(of: isLike) {
            if isLike {
                // increment the post.likeCount +1
                post.likeCount += 1
            } else {
                // decrease the post.likeCount -1
                post.likeCount = max(0, post.likeCount - 1)
            }
        }
    }
}

struct LikeButton: View {
    
    @Binding var isLike: Bool
    
    var body: some View {
        Button(action: {
            isLike.toggle()
            
        }) {
            Image(systemName: isLike ? "heart.fill" : "heart")
                .foregroundStyle(isLike ? .red : .gray)
                .imageScale(.large)
        }
    }
}
#Preview {
    
let newPost = PostModel(caption: "Having good time! #something #blablable",
    imageName: "Asset image", // The name you have stored in your Assets
    date: "May 31"
)
    PostView(post:newPost)
}

