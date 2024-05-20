//
//  AddPostViewModel.swift
//  Fish Book
//
//  Created by mostafa on 18/05/2024.
//

import Foundation




class  AddPostViewModel:ObservableObject{
   
    
    var content   : String = ""
    var imageUrl :String = ""
 

  

   // var addPostModel: AddPostModel()
    var addPostModel: AddPostModel {
        return AddPostModel(
            imageUrl: self.imageUrl,
            content: self.content
            )
        }
   
   
    
    
    let token = UserDefaults.standard.string(forKey: "jsonwebtoken")
    func addPost(){
       // var isSuccessed:Bool = false
       // let defaults  = UserDefaults.standard
        WebServices().uplloadDta(input: addPostModel, token: token!, url: "http://localhost:8080/api/posts" ){ result  in
            switch  result {
            case .success(let code ):
                print(code)
                
            
                
            case .failure(let error):
                print(error.localizedDescription)
               
            }
        }
    
    }
}
