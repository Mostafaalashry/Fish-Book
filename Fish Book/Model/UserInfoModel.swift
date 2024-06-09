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
struct UserProfileModel: Codable {
    
        var id: Int64
        var firstname: String?
        var lastname: String?
        var imageUrl: String?
        var phone: Int64?
        var address: String?
        var bio: String?
        var birthdate: String?
        var numberOfFollowers: Int32
        var numberOfFollowing: Int32
        
        // Initializer with default values
        init(id: Int64 = 0,
             firstname: String = "",
             lastname: String = "",
             imageUrl: String = "",
             phone: Int64 = 0,
             address: String = "",
             bio: String = "",
             birthdate: String = "",
             numberOfFollowers: Int32 = 0,
             numberOfFollowing: Int32 = 0) {
            self.id = id
            self.firstname = firstname
            self.lastname = lastname
            self.imageUrl = imageUrl
            self.phone = phone
            self.address = address
            self.bio = bio
            self.birthdate = birthdate
            self.numberOfFollowers = numberOfFollowers
            self.numberOfFollowing = numberOfFollowing
        }
        
     
}

class AnotherrUserProfileModel: Codable {
    var id: Int64
    var firstname: String?
    var lastname: String?
    var imageUrl: String?
    var phone: Int64?
    var address: String?
    var bio: String?
    var birthdate: String? // Assuming the birthdate is in the format "yyyy-MM-dd"
    
    // Initializer with default values
    init(id: Int64 = 0,
         firstname: String = "",
         lastname: String = "",
         imageUrl: String = "",
         phone: Int64 = 0,
         address: String = "",
         bio: String = "",
         birthdate: String = "") {
        self.id = id
        self.firstname = firstname
        self.lastname = lastname
        self.imageUrl = imageUrl
        self.phone = phone
        self.address = address
        self.bio = bio
        self.birthdate = birthdate
    }
    
    
}
