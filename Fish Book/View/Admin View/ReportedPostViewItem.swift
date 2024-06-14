//
//  ReportedPostViewItem.swift
//  Fish Book
//
//  Created by mostafa on 11/06/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReportedPostViewItem: View {
    let post : ReportedPostModel
   
    
    @State  var showAlert = false
    @State  var messege = ""
    @State  var deletePost = false
    @State  var deleteReports = false
    
    @EnvironmentObject var vm  : ReportedPostsViewModel

    var body: some View {
        VStack(spacing: 0){
            // WebImage(url: URL(string: product.imageUrl.replacingOccurrences(of: "http://", with: "https://") ?? ""))
            
            if post.publisherImage == nil || post.publisherImage == "" {
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
                    WebImage(url: URL(string: post.publisherImage!.replacingOccurrences(of: "http://", with: "https://") ?? ""))
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
           
            
           
                HStack{
                    Text(" number of report \(post.numberOfReports)")
                    
                    Image(systemName: "bookmark.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 10,height: 10)
                       
                   
                       
                }
                
          
            .padding(.top,8)
            Rectangle()
                .frame(height: 0.7)
                .foregroundColor(Color.black)
                .padding(.vertical)
            
            HStack {
               
                
                Button {
                    messege = "Are you sure that do you want to delete this post"
                    deletePost = true
                    showAlert = true
                } label: {
                    Text("Delete post" )
                    
                     .font(.system(size: 18,weight: .bold,design: .serif))
                     .frame( height: 50, alignment: .center)
                     .padding(.horizontal)
                     .background(Color("dark1"))
                     .cornerRadius(15)
                    
                }
                
                Button {
                    messege = "Are you sure that do you want to delete this all report for this post"
                    deleteReports = true
                    showAlert = true
                    
                } label: {
                    Text("Delete the report" )
                       
                        .font(.system(size: 18,weight: .bold,design: .serif))
                        .frame( height: 50, alignment: .center)
                        .padding(.horizontal)
                        .background(Color("dark1"))
                        .cornerRadius(15)
                    
                }

                
                
            }
            .padding()
            .padding(.horizontal)
            
        }
        .padding(.top)
        .background(Color.white)
        .frame(maxWidth:  UIScreen.main.bounds.width)
        .alert(isPresented: $showAlert) {
                  Alert(
                      title: Text("Delete"),
                      message: Text(messege),
                      primaryButton: .default(Text("OK")) {
                   
                          if deletePost{
                              
                              
                              vm.deleteMyPost(post: post, apiString: "http://localhost:8080/api/posts/admin/delete/\(post.id)")
                              
                              
                              
                          }
                          if deleteReports{
                              
                            
                              vm.deleteMyPost(post: post, apiString: "http://localhost:8080/api/posts/admin/reports/delete/\(post.id)")
                              
                              
                              
                              
                              
                              
                          }
                       
                        
                      },
                      secondaryButton: .cancel(Text("Cancel")) {
                         
                      }
                  )
              }
        //.padding(.vertical)
       
        
       // .edgesIgnoringSafeArea(.all)
       //     .ignoresSafeArea(.all)
    }
}
