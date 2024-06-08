//
//  AllCommentsView.swift
//  Fish Book
//
//  Created by mostafa on 08/06/2024.
//

import SwiftUI

struct AllCommentsView: View {
    let id :Int
    @State private var commentContent : String = ""
    @StateObject private var addCommentVM = AddCommentViewModel()
    @EnvironmentObject var allCommentsVM : AllCommentsViewModel
    var body: some View {
        ZStack{
            ScrollView{
                
                
                ForEach((allCommentsVM.allcomments.reversed()) , id: \.id) { comment in
                               
                      CommentView(comment: comment)
                    }
                
            }
            VStack{
                Spacer()
               
                
                   
                    HStack{
                        TextField("add comment", text: $commentContent)
                            .padding()
                            .cornerRadius(12)
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke( Color("Primary Blue") ,lineWidth: 1)
                                
                            )
                            .multilineTextAlignment(.leading)
                        Button {
                           
                            addCommentVM.content = commentContent
                            addCommentVM.addComment(id: id)
                            
                            allCommentsVM.fetchComments(id: id)
                           
                            
                        } label: {
                            Image(systemName: "paperplane.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25 , height: 25 , alignment: .center)
                                .foregroundColor(Color.blue)
                        }
                        .opacity( canProssesd() ? 1 : 0.5)
                        .disabled(!(canProssesd() ))
                        .padding(.leading)
                        
                    }
                    .padding()
                    .padding(.bottom)
                    .background(Color.white.cornerRadius(30))
                    .frame(alignment: .bottom)
                    .padding(.bottom,1)
                    
                
              
            }
            .edgesIgnoringSafeArea(.bottom)
          
            
        }
        .onAppear{
            allCommentsVM.fetchComments(id: id)
        }
    }
    func canProssesd() -> Bool{ //check if the password & email is valid
        
        return !(commentContent.isEmpty)
    }
}

/*
 struct AllCommentsView_Previews: PreviewProvider {
     static var previews: some View {
         AllCommentsView()
     }
 }
 */
