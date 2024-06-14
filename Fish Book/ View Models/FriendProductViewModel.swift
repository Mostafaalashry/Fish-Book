//
//  FriendProductViewModel.swift
//  Fish Book
//
//  Created by mostafa on 10/06/2024.
//


import Foundation
import SwiftUI



class FriendPrroductViewModel : ObservableObject {
 
    @Published   var allProduct :[ProductModel] = []
    
    
    func fetchProducts(Userid:Int){
        print("hi switch")
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken") ??  ""
        ///getPostsByJwt
        WebServices().fetchDataWithToken(urlString: "http://localhost:8080/api/products/getProductByUserId/\(Userid)", token: token) {
            
            (result: Result<[ProductModel], Error>) in
            switch result {
               
                case .success(let data):
                self.allProduct = data
                   print("all friend produuct sucesses")
                case .failure(let error):
                print(error.localizedDescription)
               
                }
        }
    }
    func report(id:Int){
        WebServices().sendID(httpMethod:"PUT",urlString: "http://localhost:8080/api/products/report/\(id)", token: UserDefaults.standard.string(forKey: "jsonwebtoken")!) { (result: Result<Int, Error>) in
            switch result {
            case .success(let success):
              
                print (success)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    
}
