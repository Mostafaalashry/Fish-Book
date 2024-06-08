//
//  AllPostsView.swift
//  Fish Book
//
//  Created by mostafa on 19/05/2024.
//

import SwiftUI

struct AllPostsView: View {
    @EnvironmentObject var vm : AllPostsViewModel
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                NavigationLink {
                  
                        AddPostView()

                    
                } label: {
                    HStack{
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45 ,height: 45,alignment: .center)
                            .clipShape(Circle())
                            .padding(.leading)
                            .foregroundColor(Color("lightgray 1"))
                        Text("Whats on yourr mind?")
                            .frame(minWidth: 0 ,maxWidth: .infinity)
                            .padding()
                            .background(Color("SecondaryBlue").cornerRadius(20))
                            .padding(.horizontal,20)
                            .foregroundColor(Color.black)
                        Image(systemName: "photo.fill.on.rectangle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40 ,height: 40,alignment: .center)
                        
                            .padding(.trailing)
                            .foregroundColor(Color.blue)
                    }
                    .padding(.vertical ,20)
                    .edgesIgnoringSafeArea(.top)
                    .frame(alignment: .top)
                    .background(Color.white)
                    .padding(.top ,50)
                }
       
                ForEach((vm.allPosts.reversed()) , id: \.id) { post in
                               
                        PostView(post: post , isFavourite: post.postLiked, numberOfLikes: Int(post.numberOfLikes!))
                    }
                   
                Spacer()
                    .frame(height: 20)
                }
               //.padding(.bottom , 20)
        }
        .onAppear(
            perform: vm.fetchPosts
        )
        .background(Color("lightGray"))
        //.padding(.bottom , 20)
       // .edgesIgnoringSafeArea(.vertical)
        
    }
}

/*
 struct AllPostsView_Previews: PreviewProvider {
     static var previews: some View {
         AllPostsView()
     }
 }
 */
