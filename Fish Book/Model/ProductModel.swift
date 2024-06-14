//
//  ProductModel.swift
//  Fish Book
//
//  Created by mostafa on 09/04/2024.
//

import Foundation


struct ProductModel:Codable {
    let id : Int64
    let title:String
    let content :String
    let price :Int32
    let imageUrl :String?
    let liked :Bool
    let categoryId :Int64
    let publisherName :String
    let publisherImage :String?
    let publisherId :Int64
    let createdOn :String
    let updatedOn :String?
}
struct ProductFavouriteModel:Codable {
    let id : Int64
    let title:String
    let content :String
    let price :Int32
    let imageUrl :String?
    let publisherName :String
    let publisherImage :String?
    let publisherId :Int64
    let createdOn :String
    let updatedOn :String?
}



struct AddProductModel:Codable {
    let price : Int
    let imageUrl:String
    let title:String
    let content :String
    let categoryId:Int
    
    init( price: Double, imageURL: String, name: String, description: String, category: Int) {
            self.price = Int(price)
            self.imageUrl = imageURL
            self.title = name
            self.content = description
            self.categoryId = category
        }
    
}

struct MyProductModel:Codable {
    let id : Int64
    let title:String
    let content :String
    let price :Int32
    let imageUrl:String
    let categoryId:Int64
    let createdOn :String
    let updatedOn :String?
}

struct UploadPrroductModel:Codable {
    let  id   : Int64
    let  title  :  String
    let  content   : String
    let  categoryId :   Int64
    let  price    : Int32
    let  imageUrl  :  String
    
    init(id: Int64, title: String, content: String, categoryId: Int64, price: Int32, imageUrl: String) {
        self.id = id
        self.title = title
        self.content = content
        self.categoryId = categoryId
        self.price = price
        self.imageUrl = imageUrl
    }
}

struct ReportedProductModel:Codable {
    var id: Int
    var title: String
    var content: String
    var publisherId: Int
    var publisherName: String
    var publisherImage: String?
    var createdOn: String
    var price: Double
    var imageUrl: String?
    var numberOfReports: Int
 
}
