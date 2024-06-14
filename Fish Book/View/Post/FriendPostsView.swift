//
//  FriendPosts.swift
//  Fish Book
//
//  Created by mostafa on 10/06/2024.
//

import SwiftUI

struct FriendPostsView: View {
    
    let id : Int
    
    @EnvironmentObject var vm : FriendPostsViewModel


    var body: some View {
       
            ScrollView{
               
       
                ForEach((vm.allPosts.reversed()) , id: \.id) { post in
                               
                        PostView(post: post , isFavourite: post.postLiked, numberOfLikes: Int(post.numberOfLikes!))
                    }
                   
                Spacer()
                    .frame(height: 20)
                }
        
        .onAppear{
            
          vm.fetchPosts(Userid: id)
            
        }
          
            
        
        .onAppear {
            if let firstPostId = vm.allPosts.first?.id {
                print(firstPostId)
            } else {
                print("No posts available")
            }
        }
        .background(Color("lightGray"))
        //.padding(.bottom , 20)
       // .edgesIgnoringSafeArea(.vertical)
        
    }
}


