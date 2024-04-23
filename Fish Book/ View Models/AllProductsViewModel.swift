//
//  GetAllProductsViewModel.swift
//  Fish Book
//
//  Created by mostafa on 09/04/2024.
//

import Foundation
import SwiftUI

class AllProductViewModel : ObservableObject{
    
   // @Published  var products = dataa.allProducts
    
    @Published  var allProducts :[ProductModel] = []
    
    func fetchProducts(){
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
        WebServices().fetchDataWithToken(urlString: "http://localhost:8080/api/products/allProductsWithFlagLikedOnes", token: token) { (result: Result<[ProductModel], Error>) in
            switch result {
                case .success(let data):
                self.allProducts = data
                   print("all Products sucesses")
                case .failure(let error):
                print(error.localizedDescription)
               
                }
        }
    }
    
}

