//
//  MyPostsViewModel.swift
//  Fish Book
//
//  Created by mostafa on 19/05/2024.
//

import Foundation

import Foundation

import Foundation
import SwiftUI

class MyPostsViewModel : ObservableObject{
    
   // @Published  var products = dataa.allProducts
    
   
    @Published   var allPosts :[PostModel] = []
    
    func fetchPosts(){
        print("hi switch")
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
        //
        WebServices().fetchDataWithToken(urlString: "http://localhost:8080/api/posts/getPostsByJwt", token: token) {
            
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
    
    func deleteMyPost(post:PostModel){
        var index  = 0
            for postt in allPosts {
                if postt.id == post.id {
                    WebServices().sendID(httpMethod:"DELETE",urlString: "http://localhost:8080/api/posts/\(postt.id)", token: UserDefaults.standard.string(forKey: "jsonwebtoken")!) { (result: Result<Int, Error>) in
                        switch result {
                        case .success(let success):
                          
                            print (success)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }

                    allPosts.remove(at: index)
                    return // Exit the function after removing the item
                }
                index = index + 1
            }
        }
    
}
