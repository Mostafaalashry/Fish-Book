//
//  AllCommentViewModel.swift
//  Fish Book
//
//  Created by mostafa on 09/06/2024.
//
import Foundation
import SwiftUI

class AllCommentsViewModel: ObservableObject {
    //var id: Int = 0
   
    @Published var allcomments: [CommentModel] = []
    
    
    func fetchComments(id:Int) {
        print("Fetching comments for post with id: \(id)")
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
        
        WebServices().fetchDataWithToken(urlString: "http://localhost:8080/api/posts/\(id)/comments", token: token) { (result: Result<[CommentModel], Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.allcomments = data
                }
                print("Comments fetched successfully")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func deletecomment(comment:CommentModel){
        var index  = 0
            for comment in allcomments {
                if comment.id == comment.id {
                    WebServices().sendID(httpMethod:"DELETE",urlString: "http://localhost:8080/api/posts/comments/\(comment.id)", token: UserDefaults.standard.string(forKey: "jsonwebtoken")!) { (result: Result<Int, Error>) in
                        switch result {
                        case .success(let success):
                          
                            print (success)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }

                    allcomments.remove(at: index)
                    return // Exit the function after removing the item
                }
                index = index + 1
            }
        }

}
