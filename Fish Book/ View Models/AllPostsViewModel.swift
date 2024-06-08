//
//  AllPostsViewModel.swift
//  Fish Book
//
//  Created by mostafa on 19/05/2024.
//

import Foundation

import Foundation
import SwiftUI

class AllPostsViewModel : ObservableObject{
    
   // @Published  var products = dataa.allProducts
    
   
    @Published   var allPosts :[PostModel] = []
    
    func fetchPosts(){
        print("hi switch")
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
        ///getPostsByJwt
        WebServices().fetchDataWithToken(urlString: "http://localhost:8080/api/posts", token: token) {
            
            (result: Result<[PostModel], Error>) in
            switch result {
               
                case .success(let data):
                self.allPosts = data
                   print("all Posts sucesses")
                case .failure(let error):
                print(error.localizedDescription)
               
                }
        }
    }
    func report(id:Int){
        WebServices().sendID(httpMethod:"POST",urlString: "http://localhost:8080/api/posts/report/\(id)", token: UserDefaults.standard.string(forKey: "jsonwebtoken")!) { (result: Result<Int, Error>) in
            switch result {
            case .success(let success):
              
                print (success)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
