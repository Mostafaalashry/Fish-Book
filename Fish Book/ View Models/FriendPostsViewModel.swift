//
//  FriendPosts.swift
//  Fish Book
//
//  Created by mostafa on 10/06/2024.
//

import Foundation
import SwiftUI



class FriendPostsViewModel : ObservableObject {
 
    @Published   var allPosts :[PostModel] = []
    
    
    func fetchPosts(Userid:Int){
        print("hi switch")
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
        ///getPostsByJwt
        WebServices().fetchDataWithToken(urlString: "http://localhost:8080/api/getPostsByUserId/\(Userid)", token: token) {
            
            (result: Result<[PostModel], Error>) in
            switch result {
               
                case .success(let data):
                self.allPosts = data
                   print("all friend posts sucesses")
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
