//
//  FavouriteProductsViewModel.swift
//  Fish Book
//
//  Created by mostafa on 16/04/2024.
//

import Foundation



import Foundation
import SwiftUI

class FavouriteProductsViewModel : ObservableObject{
    
    
    @Published  var favouriteProductss :[ProductFavouriteModel] = []
   // @Published  var favouriteProductss  = dataa.allProducts
    
    func fetchProducts(){
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
        WebServices().fetchDataWithToken(urlString: "http://localhost:8080/api/products/likedProducts", token: token) { (result: Result<[ProductFavouriteModel], Error>) in
            switch result {
                case .success(let data):
                self.favouriteProductss = data
               
                case .failure(let error):
                print(error.localizedDescription)
                }
        }
    }
    
    func deleteFromFavourite(product:ProductFavouriteModel){
        var index  = 0
            for producttt in favouriteProductss {
                if producttt.id == product.id {
                    WebServices().sendID(httpMethod:"PUT",urlString: "http://localhost:8080/api/products/dislike/\(product.id)", token: UserDefaults.standard.string(forKey: "jsonwebtoken")!) { (result: Result<Int, Error>) in
                        switch result {
                        case .success(let success):
                          
                            print (success)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }

                    favouriteProductss.remove(at: index)
                    return // Exit the function after removing the item
                }
                index = index + 1
            }
        }
    
}
