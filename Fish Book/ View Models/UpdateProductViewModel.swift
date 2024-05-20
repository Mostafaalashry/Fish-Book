//
//  UploadProductViewModel.swift
//  Fish Book
//
//  Created by mostafa on 15/05/2024.
//

import Foundation

class  UpdateProductViewModel:ObservableObject{
   
    
    var title  :  String=""
    var content   : String=""
    var imageUrl :String=""
    var categoryId :   Int64=1
    var price    : Int32=0
    var id   : Int64=0
   
    
    
    
   
   
  

    var productUpdate: UploadPrroductModel {
        return UploadPrroductModel(id: self.id,
                                   title: self.title,
                                   content: self.content,
                                   categoryId: self.categoryId,
                                   price: self.price,
                                   imageUrl: self.imageUrl
            )
        }
   
    
    
    let token = UserDefaults.standard.string(forKey: "jsonwebtoken")
    func uploadProduct(){
       // var isSuccessed:Bool = false
       // let defaults  = UserDefaults.standard
        WebServices().uplloadDta(input: productUpdate, token: token!, url: "http://localhost:8080/api/products/update" ){ result  in
            switch  result {
            case .success(let code ):
                print(code)
                
            case .failure(let error):
                print(error.localizedDescription)
               
            }
        }
    
    }
}
