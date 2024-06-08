//
//  PostView.swift
//  Fish Book
//
//  Created by mostafa on 17/05/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyPostView: View {
    
    let post:PostModel
    @State  var isFavourite:Bool
    @State  var showAlert:Bool = false
    @State  var numberOfLikes:Int
    @EnvironmentObject var vm :MyPostsViewModel

    var body: some View {
        VStack(spacing: 0){
            // WebImage(url: URL(string: product.imageUrl.replacingOccurrences(of: "http://", with: "https://") ?? ""))
            if post.publisherImageUrl == nil || post.publisherImageUrl == "" {
                HStack{
                   Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40,height: 40)
                        .foregroundColor(Color("lightgray 1"))
                        .clipShape(Circle())
                    
                    Text(post.publisherName)
                    Spacer()
                    
                }
                .padding(.leading ,12)
            }
            else
            {
                HStack{
                    WebImage(url: URL(string: post.publisherImageUrl!.replacingOccurrences(of: "http://", with: "https://") ?? ""))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40,height: 40)
                        .foregroundColor(Color("gray"))
                        .clipShape(Circle())
                    
                    Text(post.publisherName)
                    Spacer()
                    
                }
                .padding(.leading ,12)
            }
                
         
            
            HStack{
                VStack(alignment: .leading , spacing: 0){
                  
                    Text(post.content)
                       // .font(.system(size: 16,weight: .light,design: .default))
                        .multilineTextAlignment(.leading)
          
                }
                .padding()
                .frame(alignment: .leading)
                Spacer()
                
            }
            .frame(alignment: .leading)
           
            if post.imageUrl != nil && post.imageUrl != ""  {
                WebImage(url: URL(string: post.imageUrl!.replacingOccurrences(of: "http://", with: "https://") ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth:  UIScreen.main.bounds.width)
            }
           
            
            HStack {
                HStack{
                    Image(systemName: "hand.thumbsup.circle.fill")
                         .resizable()
                         .scaledToFit()
                         .frame(width: 25,height: 25 ,alignment: .center)
                         .foregroundColor(Color.blue)
                    Text("\( numberOfLikes)")
                        .foregroundColor(Color("gray"))
                }
                .padding(.leading,50)
                Spacer()
                HStack{
                  
                    
                    Text("\(post.numberOfComments!) Comments")
                        .foregroundColor(Color("gray"))
                }
                
                .padding(.trailing,50)
                // message
            }
            .padding(.top,8)
            Rectangle()
                .frame(height: 0.7)
                .foregroundColor(Color("gray"))
                .padding(.vertical)
            
            HStack {
                Button {
                    let urlString  = isFavourite ? "http://localhost:8080/api/posts/dislike/\(post.id)" : "http://localhost:8080/api/posts/like/\(post.id)"
                    
                    let token  = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
                    print("token"+token)
                    print("token"+urlString)
                    WebServices().sendID(httpMethod:"PUT",urlString: urlString, token: token) { (result: Result<Int, Error>) in
                        switch result {
                        case .success(let success):
                            isFavourite.toggle()
                            if isFavourite{
                               numberOfLikes = numberOfLikes + 1
                            }
                            else{
                                numberOfLikes = numberOfLikes - 1
                                
                            }
                            print (success)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    
                   
                } label: {
                    
                    
                    HStack{
                        Image(systemName:isFavourite ?"hand.thumbsup.fill": "hand.thumbsup")
                             .resizable()
                             .scaledToFit()
                             .frame(width: 25,height: 25 ,alignment: .center)
                             .foregroundColor(Color.blue)
                        
                        Text(isFavourite ? "dislike" : "Like")
                            .foregroundColor(Color("gray"))
                    }
                    .padding(.leading,50)
                    
                }

                Spacer()
                
                NavigationLink {
                    AllCommentsView(id: Int(post.id))
                } label: {
                    HStack{
                        Image(systemName: "message")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25,height: 25 ,alignment: .center)
                            .foregroundColor(Color("gray"))
                        
                        Text("Comment")
                            .foregroundColor(Color("gray"))
                    }
                    
                    .padding(.trailing,50)
                }

                
             
                // message
            }
            
        }
        
        /*
         Button {
             showAlert = true
         } label: {
             Image(systemName: "bookmark.fill")
                 .resizable()
                 .scaledToFill()
                 .frame(width: 10,height: 10)
                 .foregroundColor(Color("gray"))
         }
         .frame(alignment: .trailing)
         .padding(.trailing , 20)
         .padding(.top , 22)
         */
        .padding(.vertical)
        .background(Color.white)
        .overlay(
           
            Menu(content: {
                Button {
                 
                   
                    vm.deleteMyPost(post: post)
                    
                } label: {
                    
                    Text("Delete")
                        .foregroundColor(Color.red)
                }
              
              

            }, label: {
               Image(systemName: "ellipsis")
                    .padding()
            })
        
            ,alignment: .topTrailing
                
        )
        
        .edgesIgnoringSafeArea(.all)
            .ignoresSafeArea(.all)
    }
}
/*
 struct PostView_Previews: PreviewProvider {
     static var previews: some View {
         PostView()
     }
 }
 */

