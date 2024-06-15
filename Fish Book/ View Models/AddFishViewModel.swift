//
//  AddFishViewModel.swift
//  Fish Book
//
//  Created by mostafa on 15/06/2024.
//

import Foundation





class  AddFishViewModel:ObservableObject{
   
    
    var name   : String = ""
    var imageUrl :String = ""
    var fishDetails:[FishDeetails] = []
 

  

   // var addPostModel: AddPostModel()
    var addFishModel: AddFishModel {
        return AddFishModel(
            name: name, imageUrl: imageUrl, fishDetails: fishDetails
            )
        }
   
   
    
    
    let token = UserDefaults.standard.string(forKey: "jsonwebtoken")
    func addFish(){
       // var isSuccessed:Bool = false
       // let defaults  = UserDefaults.standard
        WebServices().uplloadDta(input: addFishModel, token: token!, url: "http://localhost:8080/api/fish/save" ){ result  in
            switch  result {
            case .success(let code ):
                print(code)
                
            
                
            case .failure(let error):
                print(error.localizedDescription)
               
            }
        }
    
    }
}
