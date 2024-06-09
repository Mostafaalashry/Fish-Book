//
//  UserProfileViewModel.swift
//  Fish Book
//
//  Created by mostafa on 09/06/2024.
//

import Foundation




import SwiftUI

class UserProfileViewModel:ObservableObject {
    
   // @Published  var products = dataa.allProducts
    
   
    @Published var userProfile: UserProfileModel
   
    init() {
          self.userProfile = UserProfileModel()
      }
    
    func fetchUserProfile(){
        print("hi switch")
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
        ///getPostsByJwt
        WebServices().fetchDataWithToken(urlString: "http://localhost:8080/api/users/profile", token: token) {
            
            (result: Result<UserProfileModel, Error>) in
            switch result {
               
                case .success(let data):
                self.userProfile = data
                   print("user profile")
                case .failure(let error):
                print(error.localizedDescription)
               
                }
        }
    }
  
    
}
