//
//  UpdateUserInfoViewModel.swift
//  Fish Book
//
//  Created by mostafa on 28/04/2024.
//

import Foundation

class  UpdateUserInfoViewModel:ObservableObject{
   
    
    var firstname :String=""
    var lastname :String=""
    var imageUrl :String=""
    var address :String=""
    var bio :String=""
    var phone :Int64=0
    var birthdate:String=""

    var userinfo: UserInfoModel {
        return UserInfoModel(    firstname: self.firstname,
                                 lastname: self.lastname,
                                 imageUrl: self.imageUrl,
                                 address: self.address,
                                 bio: self.bio,
                                 phone: self.phone,
                                 birthdate: self.birthdate
            )
        }
   
    
    
    let token = UserDefaults.standard.string(forKey: "jsonwebtoken")
    func uploadUserInfo (){
       // var isSuccessed:Bool = false
       // let defaults  = UserDefaults.standard
        WebServices().uplloadDta(input: userinfo, token: token!, url: "http://localhost:8080/api/users/edit" ){ result  in
            switch  result {
            case .success(let code ):
                print(code)
                
            case .failure(let error):
                print(error.localizedDescription)
               
            }
        }
    
    }
}
