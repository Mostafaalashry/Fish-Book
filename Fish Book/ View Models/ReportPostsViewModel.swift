//
//  ReportPostsViewModel.swift
//  Fish Book
//
//  Created by mostafa on 14/06/2024.
//




import Foundation
import SwiftUI

class ReportedPostsViewModel : ObservableObject{
    
   // @Published  var products = dataa.allProducts
    
   
    @Published   var allReportedPosts :[ReportedPostModel] = []
    
    func fetchReportedPosts(){
        
       
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
        //
        WebServices().fetchDataWithToken(urlString: "http://localhost:8080/api/posts/reported", token: token) {
            
            (result: Result<[ReportedPostModel], Error>) in
            switch result {
               
                case .success(let data):
                self.allReportedPosts = data
                   print("all Posts reported sucesses")
                case .failure(let error):
                print(error.localizedDescription)
               
                }
        }
    }
    //
    func deleteMyPost(post:ReportedPostModel , apiString : String){
        var index  = 0
            for postt in allReportedPosts {
                if postt.id == post.id {
                    WebServices().sendID(httpMethod:"DELETE",urlString: apiString, token: UserDefaults.standard.string(forKey: "jsonwebtoken")!) { (result: Result<Int, Error>) in
                        switch result {
                        case .success(let success):
                          
                            print (success)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }

                    allReportedPosts.remove(at: index)
                    return // Exit the function after removing the item
                }
                index = index + 1
            }
        }
    
}
