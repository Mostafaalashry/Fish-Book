//
//  MyPostsView.swift
//  Fish Book
//
//  Created by mostafa on 19/05/2024.
//

import SwiftUI

struct MyPostsView: View {
    @EnvironmentObject var vm : MyPostsViewModel
    var body: some View {
        ScrollView(showsIndicators:false){
            
            ForEach((vm.allPosts) , id: \.id) { post in
                       
                MyPostView(post: post , isFavourite: post.postLiked, numberOfLikes: Int(post.numberOfLikes!))
            }
           
        Spacer()
            .frame(height: 20)
            
        }
        .background(Color("lightGray"))
        .onAppear(
            perform: vm.fetchPosts
        )
    }
}

struct MyPostsView_Previews: PreviewProvider {
    static var previews: some View {
        MyPostsView()
    }
}
