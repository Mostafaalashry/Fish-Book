//
//  AddCoommentViewModel.swift
//  Fish Book
//
//  Created by mostafa on 09/06/2024.
//

import Foundation


class  AddCommentViewModel:ObservableObject{
   
    
    var content   : String = ""
  
    var postid:Int = 0


   // var addPostModel: AddPostModel()
    var addCommentModel: AddCommentModel {
        return AddCommentModel(
      
            content: self.content
            )
        }
   
   
    
    
    let token = UserDefaults.standard.string(forKey: "jsonwebtoken")
    func addComment(id:Int){
       // var isSuccessed:Bool = false
       // let defaults  = UserDefaults.standard
        WebServices().uplloadDta(input: addCommentModel, token: token!, url: "http://localhost:8080/api/posts/\(id)/comments" ){ result  in
            switch  result {
            case .success(let code ):
                print(code)
                
            case .failure(let error):
                print(error.localizedDescription)
               
            }
        }
    
    }
}
