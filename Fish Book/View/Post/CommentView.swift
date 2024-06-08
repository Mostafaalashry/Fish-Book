//
//  CommentView.swift
//  Fish Book
//
//  Created by mostafa on 08/06/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct CommentView: View {
    let comment : CommentModel
    @State private var showAlert = false
    @EnvironmentObject var vm :AllCommentsViewModel

    var body: some View {
        HStack{
            
            //
            if comment.publisherImageUrl == nil || comment.publisherImageUrl == "" {
               
                Image(systemName: "person.crop.circle.fill")
                     .resizable()
                     .scaledToFill()
                     .frame(width: 40,height: 40)
                     .foregroundColor(Color("lightgray 1"))
                     .clipShape(Circle())
                     .padding(.bottom,21)
                    
               
            }
            else
            {
                
           
                WebImage(url: URL(string:comment.publisherImageUrl!.replacingOccurrences(of: "http://", with: "https://") ?? ""))
                
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40,height: 40)
                    .foregroundColor(Color("lightGray"))
                    .clipShape(Circle())
                    .padding(.bottom,21)
                      .clipShape(Circle())
                    
                    
               
            }

            //
        
            VStack{
                HStack{
                    Text(comment.publisherName)
                        .font(.title2)
                    Spacer()
                }
            
                HStack{
                    Text(comment.content)
                        .frame(alignment: .leading)
                    Spacer()
                }
                
                
            }
            .padding(5)
            .background(Color("lightGray").cornerRadius(12))
        }
        .padding()
        .overlay(
           
            Menu(content: {
                Button {
                 
                    vm.deletecomment(comment: comment)
                   
                    
                } label: {
                    
                    Text("Delete")
                        .foregroundColor(Color.red)
                }
               
              

            }, label: {
               Image(systemName: "ellipsis")
                    .padding()
                    .padding()
            })
        
            ,alignment: .topTrailing
                
        )
    }
}
/*
 struct CommentView_Previews: PreviewProvider {
     static var previews: some View {
         CommentView()
     }
 }
 */

