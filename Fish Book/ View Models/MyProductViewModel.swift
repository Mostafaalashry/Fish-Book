//
//  MyProductViewModel.swift
//  Fish Book
//
//  Created by mostafa on 23/04/2024.
//



//http://localhost:8080/api/products/like

import Foundation
import SwiftUI

class MyProductViewModel : ObservableObject{
    
    
    @Published  var myProducts :[MyProductModel] = []
   // @Published  var favouriteProductss  = dataa.allProducts
    
    func fetchProducts(){
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
        WebServices().fetchDataWithToken(urlString: "http://localhost:8080/api/products/getProductsThatIOwn", token: token) { (result: Result<[MyProductModel], Error>) in
            switch result {
                case .success(let data):
                self.myProducts = data
               
                case .failure(let error):
                print(error.localizedDescription)
                }
        }
    }
    
    func deleteMyProduct(product:MyProductModel){
        var index  = 0
            for producttt in myProducts {
                if producttt.id == product.id {
                    WebServices().sendID(httpMethod:"DELETE",urlString: "http://localhost:8080/api/products/\(product.id)", token: UserDefaults.standard.string(forKey: "jsonwebtoken")!) { (result: Result<Int, Error>) in
                        switch result {
                        case .success(let success):
                          
                            print (success)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }

                    myProducts.remove(at: index)
                    return // Exit the function after removing the item
                }
                index = index + 1
            }
        }
    
}
