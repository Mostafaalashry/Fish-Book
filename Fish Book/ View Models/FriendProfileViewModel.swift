//
//  FriendProfileViewModel.swift
//  Fish Book
//
//  Created by mostafa on 10/06/2024.
//

import Foundation
import SwiftUI

class FriendProfileViewModel:ObservableObject {
    
   // @Published  var products = dataa.allProducts
    
   
    @Published var frriendProfile: FriendProfileModel
   
    init() {
          self.frriendProfile = FriendProfileModel()
      }
    
    func fetchUserProfile(id :Int){
        print("hi switch")
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
        ///getPostsByJwt
        WebServices().fetchDataWithToken(urlString: "http://localhost:8080/api/users/profile/\(id)", token: token) {
            
            (result: Result<FriendProfileModel, Error>) in
            switch result {
               
                case .success(let data):
                self.frriendProfile = data
                   print("user profile")
                case .failure(let error):
                print(error.localizedDescription)
               
                }
        }
    }
  
    
}
