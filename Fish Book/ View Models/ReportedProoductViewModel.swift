//
//  ReportedProoductViewModel.swift
//  Fish Book
//
//  Created by mostafa on 15/06/2024.
//



import Foundation
import SwiftUI

class ReportedProductViewModel : ObservableObject{
    
   // @Published  var products = dataa.allProducts
    
   
    @Published   var allReportedProduct :[ReportedProductModel] = []
    
    func fetchReportedProduct(){
        
       
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
        //
        WebServices().fetchDataWithToken(urlString: "http://localhost:8080/api/products/reported", token: token) {
            
            (result: Result<[ReportedProductModel], Error>) in
            switch result {
               
                case .success(let data):
                self.allReportedProduct = data
                   print("all Posts reported sucesses")
                case .failure(let error):
                print(error.localizedDescription)
               
                }
        }
    }
    //
    func deleteMyPost(prroduct:ReportedProductModel , apiString : String){
        var index  = 0
            for productt in allReportedProduct {
                if productt.id == prroduct.id {
                    WebServices().sendID(httpMethod:"DELETE",urlString: apiString, token: UserDefaults.standard.string(forKey: "jsonwebtoken")!) { (result: Result<Int, Error>) in
                        switch result {
                        case .success(let success):
                          
                            print (success)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }

                    allReportedProduct.remove(at: index)
                    return // Exit the function after removing the item
                }
                index = index + 1
            }
        }
    
}
