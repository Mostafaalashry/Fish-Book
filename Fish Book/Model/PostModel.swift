//
//  PostModel.swift
//  Fish Book
//
//  Created by mostafa on 18/05/2024.
//

import Foundation


struct AddPostModel:Codable {
    let imageUrl:String?
    let content :String?
    
    init(imageUrl: String, content: String) {
        self.imageUrl = imageUrl
        self.content = content
    }
    
}

struct PostModel:Codable{
    let id    :Int64
    let content    :String
    let imageUrl    :String?
    let publisherId    :Int64
    let publisherName    :String
    let publisherImageUrl   :String?
    let createdAt    :String
    let numberOfLikes    :Int32?
    let postLiked    :Bool
    let numberOfComments : Int32?

}


class ReportedPostModel: Codable {
     var id: Int64
     var content: String
     var imageUrl: String?
     var  publisherId: Int64
     var publisherName: String
     var publisherImage: String?
     var createdAt: String
     var numberOfLikes: Int32
     var numberOfComments: Int32
     var numberOfReports: Int32
    
   
    
}
