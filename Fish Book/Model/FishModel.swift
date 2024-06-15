//
//  FishModel.swift
//  Fish Book
//
//  Created by mostafa on 13/05/2024.
//

import Foundation
import SwiftUI

struct FishModel:Codable {
   
    let id :Int64
    let name :String
    let imageUrl :String?
    let fishDetails:[FishDeetails]
    
    init(id: Int64, name: String, imageUrl: String?, fishDetails: [FishDeetails]) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.fishDetails = fishDetails
    }
    
}
struct AddFishModel:Codable {
   
   
    let name :String
    let imageUrl :String?
    let fishDetails:[FishDeetails]
    
    init(name: String, imageUrl: String?, fishDetails: [FishDeetails]) {
       
        self.name = name
        self.imageUrl = imageUrl
        self.fishDetails = fishDetails
    }
    
}


struct FishDeetails:Codable {
    let header:String
    let content :String
}
struct FishDeetailsUI: Identifiable {
    let id = UUID()
    var header: String
    var content: String
    
    init(header: String = "", content: String = "") {
        self.header = header
        self.content = content
    }
}
