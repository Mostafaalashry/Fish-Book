//
//  WebServices.swift
//  Fish Book
//
//  Created by mostafa on 09/03/2024.
//

import Foundation
import UIKit

enum AuthenticationError: Error{
    case invalidCredentials
    case custom(errorMessage : String)
     }
enum AAuthenticationError: Error{
    case invalidCredentials
    case custom(errorMessage : String)
     }


class WebServices {
    
    func login(email:String, password: String , completion : @escaping (Result <String,AAuthenticationError>) -> Void){
        
        guard let url = URL(string: "http://localhost:8080/api/v1/auth/authenticate")
        else
        {
            completion(.failure(.custom(errorMessage: "Invalid URL")))
            return
        }
        
        let body = LoginRequest(email: email, password: password)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        // request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data , error == nil else
            {
                print("eerror 1")
                completion(.failure(.custom(errorMessage: "No Data")))
                return
            }
            print(data)
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data)
            else
            {
                print("eerror 2")
                completion(.failure(.invalidCredentials))
                return
            }
            guard let token  =  loginResponse.token else {
                print("eerror 3")
                completion(.failure(.invalidCredentials))
                return
            }
            completion(.success(token))
            
        }.resume()
    }
    
    func SignUp(firstname:String,lastname:String,email:String, password: String , completion : @escaping (Result <String,AuthenticationError>) -> Void){
        
        guard let url = URL(string: "http://localhost:8080/api/v1/auth/register")
                    else
                    {
                        completion(.failure(.custom(errorMessage: "Invalid URL")))
                        return
                    }
        
        let body = SignUpRequest(firstname: firstname, lastname: lastname, email: email, password: password)
        var request = URLRequest(url: url)
            request.httpMethod = "POST"
           // request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONEncoder().encode(body)
            URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data , error == nil else
                    {
                        completion(.failure(.custom(errorMessage: "No Data")))
                        return
                    }
            
            guard let signUpResponse = try? JSONDecoder().decode(SignUpResponse.self, from: data)
                            else
                            {
                                completion(.failure(.invalidCredentials))
                                return
                            }
            guard let token  = signUpResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            completion(.success(token))
            
            
        }.resume()
        
    }
    
    func uploadImage(image: UIImage ,url :String  ,completion: @escaping (Result<String, AuthenticationError>) -> Void)  {
        guard let imageData = image.jpegData(compressionQuality: 0.95) else {
          //  print("Failed to convert image to JPEG data")
            completion(.failure(.custom(errorMessage: "Failed to convert image to JPEG dataL")))
            return
        }

        guard let url = URL(string: url) else {
           // print("Invalid URL for image upload")
            completion(.failure(.custom(errorMessage: "Invalid URL")))
            return
        }
        let token = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var body = Data()
        
        // Append image data
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n".data(using: .utf8)!)
        
        // Append end boundary
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                print("HTTP Error: \(httpResponse.statusCode)")
                return
            }
            
            if let responseData = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(ResponseData.self, from: responseData)
                  //  print("Image URL: \(decodedResponse.url)")
                    completion(.success(decodedResponse.url))
                     
                    // Handle success
                } catch {
                    print("Error decoding response: \(error)")
                }
            } else {
                print("No response data")
            }
        }
        
        task.resume()
        
        
    }
    
    func uplloadDta<T: Codable>(input: T,
                            token: String,
                            url: String,
                            completion: @escaping (Result<Int, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.custom(errorMessage: "Invalid URL")))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpBody = try? JSONEncoder().encode(input)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, error == nil else {
                completion(.failure(.custom(errorMessage: "No Data")))
                return
            }
            
            let statusCode = httpResponse.statusCode
            completion(.success(statusCode))
        }.resume()
    }
/*
    func uploadImage(image: UIImage, uploadSuccess: @escaping (Bool) -> Void, urlStringHandler: @escaping (String?) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            return
        }
        //http://localhost:8080/api/image/uploadProductImage
        //http://localhost:8080/uploadImage
        guard let url = URL(string: "http://localhost:8080/api/image/uploadProductImage") else {
            return
        }
        
        let boundary = UUID().uuidString
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var body = Data()

        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n".data(using: .utf8)!)

        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                uploadSuccess(false)
                urlStringHandler(nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                uploadSuccess(false)
                urlStringHandler(nil)
                return
            }
            
            if let responseData = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(ResponseData.self, from: responseData)
                    let urlString = String(decodedResponse.url)
                    print("Image URL: \(decodedResponse.url)")
                    uploadSuccess(true)
                    urlStringHandler(urlString)
                } catch {
                    print("Error decoding response: \(error)")
                    uploadSuccess(false)
                    urlStringHandler(nil)
                }
            }
        }
        task.resume()
    }
    
    */
    
    /*
    func uploadImagee(image: UIImage ,imageURLL:String ,uploadSucsess:Bool ) {
                guard let imageData = image.jpegData(compressionQuality: 0.8) else {
                    return
                }
                
                guard let url = URL(string: "http://localhost:8080/uploadImage") else {
                    return
                }
                
                let boundary = UUID().uuidString
                
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
                
                var body = Data()

               
                body.append("--\(boundary)\r\n".data(using: .utf8)!)

                
                body.append("Content-Disposition: form-data; name=\"image\";     filename=\"image.jpg\"\r\n".data(using: .utf8)!)
                body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
                body.append(imageData)
                body.append("\r\n".data(using: .utf8)!)

                body.append("--\(boundary)--\r\n".data(using: .utf8)!)
                
                request.httpBody = body
                
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    if let error = error {
                        print("Error: \(error)")
                    } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                        if let responseData = data {
                            do {
                                let decodedResponse = try JSONDecoder().decode(ResponseData.self, from: responseData)
                                 imageURLL =  String(decodedResponse.url)
                                
                                print("Image URL: \(decodedResponse.url)")
                                
                                DispatchQueue.main.async {
                                    
                                    uploadSucsess = true
                                }
                            } catch {
                                print("Error decoding response: \(error)")
                            }
                        }
                    }
                }
                task.resume()
            }
    */

    func fetchDataWithToken<T: Codable>(urlString: String, token: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                }
                return
            }
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                   
                DispatchQueue.main.async {
                    completion(.success(decodedObject))
                   
                    if let httpResponse = response as? HTTPURLResponse {
                        print((httpResponse.statusCode))
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    print ("can not decode ")
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func sendID(httpMethod : String,urlString: String,  token: String , completion: @escaping (Result<Int, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
           
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
       // request.addValue("text/plain", forHTTPHeaderField: "Content-Type")
       
       // request.addValue(" application/json", forHTTPHeaderField: "Content-Type")

        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        print("second "+token)
       
       
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                completion(.success(httpResponse.statusCode))
            } else if let error = error {
                completion(.failure(error))
            } else {
                completion(.failure(NSError(domain: "No response received", code: 0, userInfo: nil)))
            }
        }.resume()
    }
}




/*
 func SignUp(firstname:String,lastname:String,email:String, password: String , completion : @escaping (Result <String,AuthenticationError>) -> Void){
     
     guard let url = URL(string: "http://localhost:8080/api/v1/auth/register")
                 else
                 {
                     completion(.failure(.custom(errorMessage: "Invalid URL")))
                     return
                 }
     
     let body = SignUpRequest(firsttname: firstname, lastname: lastname, email: email, Password: password)
     var request = URLRequest(url: url)
         request.httpMethod = "POST"
        // request.setValue("application/json", forHTTPHeaderField: "Accept")
         request.addValue("application/json", forHTTPHeaderField: "Content-Type")
         request.httpBody = try? JSONEncoder().encode(body)
         URLSession.shared.dataTask(with: request) { data, response, error in
         guard let data = data , error == nil else
                 {
                     completion(.failure(.custom(errorMessage: "No Data")))
                     return
                 }
         
         guard let signUpResponse = try? JSONDecoder().decode(SignUpResponse.self, from: data)
                         else
                         {
                             completion(.failure(.invalidCredentials))
                             return
                         }
         guard let token  = signUpResponse.token else {
             completion(.failure(.invalidCredentials))
             return
         }
         completion(.success(token))
         
         
     }.resume()
     
 }*/




/**
 func SignUp(firstname:String,lastname:String,email:String, password: String ) {
     
     let url = URL(string: "http://localhost:8080/api/v1/auth/register")!
     
     
     let body = SignUpRequest(firstname: firstname, lastname: lastname, email: email, password: password)
     var request = URLRequest(url: url)
     request.httpMethod = "POST"
     // request.setValue("application/json", forHTTPHeaderField: "Accept")
     request.addValue("application/json", forHTTPHeaderField: "Content-Type")
     request.httpBody = try? JSONEncoder().encode(body)
     URLSession.shared.dataTask(with: request) { data, response, error in
          let data = data
                 
                 
        let signUpResponse = try? JSONDecoder().decode(SignUpResponse.self, from: data!)
                 
         let token  = signUpResponse?.token
         
         
         
     }.resume()
     
 }
 */



/**
 
 func uploadImage(image: UIImage , uploadSucsess:Bool , urlString:String) {
     guard let imageData = image.jpegData(compressionQuality: 0.8) else {
         return
     }
     
     guard let url = URL(string: "http://localhost:8080/uploadImage") else {
         return
     }
     
     let boundary = UUID().uuidString
     
     var request = URLRequest(url: url)
     request.httpMethod = "POST"
     request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
     
     var body = Data()

    
     body.append("--\(boundary)\r\n".data(using: .utf8)!)

     
     body.append("Content-Disposition: form-data; name=\"image\";     filename=\"image.jpg\"\r\n".data(using: .utf8)!)
     body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
     body.append(imageData)
     body.append("\r\n".data(using: .utf8)!)

     body.append("--\(boundary)--\r\n".data(using: .utf8)!)
     
     request.httpBody = body
     
     let task = URLSession.shared.dataTask(with: request) { data, response, error in
         if let error = error {
             print("Error: \(error)")
         } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
             if let responseData = data {
                 do {
                     let decodedResponse = try JSONDecoder().decode(ResponseData.self, from: responseData)
                     urlString = String(decodedResponse.url)
                     print("Image URL: \(decodedResponse.url)")
                     
                     DispatchQueue.main.async {
                         uploadSucsess = true
                     }
                 } catch {
                     print("Error decoding response: \(error)")
                 }
             }
         }
     }
     task.resume()
 }
 
 */
