//
//  ProductViewModel.swift
//  Fish Book
//
//  Created by mostafa on 22/03/2024.
//

import Foundation

class  AddProduuctViewModel:ObservableObject{
    var price : Double = 0.0
    var imageURL = ""
    var name = ""
    var description = ""
    var category = 0
    

    var product: AddProductModel {
            return AddProductModel(price: self.price,
                                   imageURL: self.imageURL,
                                   name: self.name,
                                   description: self.description,
                                   category: self.category)
        }
    
    let token = UserDefaults.standard.string(forKey: "jsonwebtoken")
    @Published var isAuthenticated:Bool = false
    func addProduct (){
       // var isSuccessed:Bool = false
       // let defaults  = UserDefaults.standard
        WebServices().uplloadDta(input: product, token: token!, url: "http://localhost:8080/api/products" ){ result  in
            switch  result {
            case .success(let code ):
                print(code)
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            case .failure(let error):
                print(error.localizedDescription)
               
            }
        }
    
    }
}
