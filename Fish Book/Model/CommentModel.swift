//
//  CommentModel.swift
//  Fish Book
//
//  Created by mostafa on 09/06/2024.
//

import Foundation



struct CommentModel: Codable {
    let id: Int64
    let content: String
    let publisherId: Int64
    let publisherName: String
    let publisherImageUrl: String?
    let createdAt: String
}

struct AddCommentModel:Codable{
    
  
    let content    :String
   
   

}
