//
//  SignUpViewModel.swift
//  Fish Book
//
//  Created by mostafa on 11/03/2024.
//

import Foundation



class  SignUpViewModel:ObservableObject{
   var firstname = ""
   var lastname = ""
   var email = ""
   var password = ""
   @Published var isAuthenticated:Bool = false
    func SignUp (){
       // var isSuccessed:Bool = false
        let defaults  = UserDefaults.standard
        WebServices().SignUp(firstname: firstname, lastname: lastname, email: email, password: password ) { result  in
            switch  result {
            case .success(let token ):
                print(token)
                defaults.setValue(token, forKey: "jsonwebtoken")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            case .failure(let error):
                print(error.localizedDescription)
               
            }
        }
    
    }
}


/**
 func SignUp (){
     let defaults  = UserDefaults.standard
     
     WebServices().SignUp(firstname: firstname, lastname: lastname, email: email, password: password ) { result  in
         switch  result {
         case .success(let token ):
             print(token)
             defaults.setValue(token, forKey: "jsonwebtoken")
             DispatchQueue.main.async {
                 self.isAuthenticated = true
             }
         case .failure(let error):
             print("error mmm")
             print(error.localizedDescription)
             print("error mmm")
         }
     }
 }
 */
