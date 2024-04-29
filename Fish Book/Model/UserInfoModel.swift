//
//  UserInfoModel.swift
//  Fish Book
//
//  Created by mostafa on 28/04/2024.
//

import Foundation
class UserInfoModel :Codable{
    
    let firstname :String
    let lastname :String
    let imageUrl :String?
    let address :String?
    let bio :String?
    let phone :Int64?
    let birthdate:String?
    
    init(firstname: String, lastname: String, imageUrl: String, address: String, bio: String, phone: Int64, birthdate: String) {
        self.firstname = firstname
        self.lastname = lastname
        self.imageUrl = imageUrl
        self.address = address
        self.bio = bio
        self.phone = phone
        self.birthdate = birthdate
    }
    
}


