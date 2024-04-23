//
//  AuthenticationModeel.swift
//  Fish Book
//
//  Created by mostafa on 23/04/2024.
//

import Foundation

struct LoginRequest : Codable
  {
      let email : String
      let password : String
  }

struct LoginResponse : Codable
{
    let token : String?
  
}
struct SignUpRequest : Codable
  {
      let firstname : String
      let lastname : String
      let email : String
      let password : String
  }

struct SignUpResponse : Codable
{
    let token : String?

}
struct ResponseData: Codable {
    let url: String
}
