//
//  FriendProfileModel.swift
//  Fish Book
//
//  Created by mostafa on 10/06/2024.
//

import Foundation


class FriendProfileModel: Codable {
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
    var followed: Bool
    
    
    init(id: Int64 = 0,
         firstname: String = "",
         lastname: String = "",
         imageUrl: String = "",
         phone: Int64 = 0,
         address: String = "",
         bio: String = "",
         birthdate: String = "",
         numberOfFollowers: Int32 = 0,
         numberOfFollowing: Int32 = 0,
         followed: Bool = false) {
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
        self.followed = followed
    }
}
