//
//  APIServices.swift
//  Fish Book
//
//  Created by mostafa on 29/02/2024.
//

import Foundation


public class APIServices{
   public static let shared = APIServices()
    
    public enum APIErrorr:Error{
        case error(_ errorString:String)
    }
    
    public  func getJson< T: Decodable> (urllString:String ,
                                       dataDecodingStrategy:JSONDecoder.DateDecodingStrategy = .deferredToDate
                                      , keyDecodingStarategy:JSONDecoder.KeyDecodingStrategy = .useDefaultKeys
       
    , completion:@escaping(Result<T,APIErrorr>) -> Void){
        
        guard let url = URL(string: urllString)else{
            completion(.failure(.error(NSLocalizedString("invalid url", comment: ""))))
            
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                completion(.failure(.error("Error\(error.localizedDescription)")))
                return
            }
            guard let data = data else{
                completion(.failure(.error(NSLocalizedString("errror data us corrupt", comment: ""))))
                return
            }
            let decodeer = JSONDecoder()
          //  decodeer.dateDecodingStrategy = dataDecodingStrategy
            decodeer.keyDecodingStrategy  = keyDecodingStarategy
            do{
                let decodeData = try decodeer.decode(Forecast.self, from: data)
            }
            catch let decodingError{
                completion(.failure(APIErrorr.error("EError \(decodingError.localizedDescription)")))
                return
            }
            
        }.resume()
    }
    
    
}
