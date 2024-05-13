//
//  FishViewModel.swift
//  Fish Book
//
//  Created by mostafa on 13/05/2024.
//

import Foundation


import Foundation
import SwiftUI

class FishViewModel : ObservableObject{
    
   
    
    @Published  var allFishes :[FishModel] = []
    
    func fetchFishes(){
        print("hi switch")
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
        WebServices().fetchDataWithToken(urlString: "http://localhost:8080/api/fish", token: token) {
            
            (result: Result<[FishModel], Error>) in
            switch result {
               
                case .success(let data):
                self.allFishes = data
                   print("all fishes sucesses")
                case .failure(let error):
                print(error.localizedDescription)
               
                }
        }
    }
    
}
