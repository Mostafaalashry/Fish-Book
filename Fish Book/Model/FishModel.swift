//
//  FishModel.swift
//  Fish Book
//
//  Created by mostafa on 13/05/2024.
//

import Foundation


struct FishModel:Codable {
   
    let id :Int64
    let name :String
    let imageUrl :String?
    let fishDetails:[FishDeetails]
}

struct FishDeetails:Codable {
    let header:String
    let content :String
}
