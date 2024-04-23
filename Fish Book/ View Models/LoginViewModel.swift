//
//  LoginViewModel.swift
//  Fish Book
//
//  Created by mostafa on 09/03/2024.
//

import Foundation
import SwiftUI


class  LoginViewModel:ObservableObject{
   var email = ""
   var password = ""
    
  //  var isSuccessed :Bool =  false
  @Published   var isAuthenticated:Bool = false
  @Published   var showAlert:Bool = false

    
   
    
    func login (){
        let defaults  = UserDefaults.standard
        
        WebServices().login(email: email, password: password) { result  in
            switch  result {
            case .success(let token ):
              
                print(token)
                defaults.setValue(token, forKey: "jsonwebtoken")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            case .failure(let error):
            self.showAlert = true
                print(error.localizedDescription)
              
            }
        }
      

    }
   
}
