//
//  ImageAPIEX.swift
//  Fish Book
//
//  Created by mostafa on 16/03/2024.
import SwiftUI



struct ResponseData: Codable {
    let url: String
}

struct AddProductView: View {
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State private var uploadSucsess = false
    @State private var text: String = ""
    @State private var type: Int = 1

    @State private var descrription: String = ""
    @State private var name: String = ""
    @State private var price: String = ""
    @State private var imageURL: String = ""
    @StateObject private var addProductVM = AddProduuctViewModel()


    var body: some View {
        
        
        VStack{
            VStack{
                Text(" Add product")
                    .font(.system(size: 28,weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(
                        
                        LinearGradient(
                            colors: [.red, Color("Primary Blue")],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                
                
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                       
                        .cornerRadius(10)
                        
                    
                } else {
                   // Text("No image selected")
                    Image(systemName: "photo")
                        .resizable()
                       // .scaledToFit()
                        .foregroundColor(Color("SecondaryBlue"))

                }
                
                
                
                Button(action: {
                    self.isShowingImagePicker = true
                }) {
                    Text("Select Image")
                        .foregroundColor(Color("Primary Blue"))                }
                .sheet(isPresented: $isShowingImagePicker) {
                    ImagePicker(selectedImage: self.$selectedImage)
                }
                
                Button(action: {
                    // Call API to upload image here
                    if let image = self.selectedImage {
                        uploadImage(image: image) 
                 }
                }) {
                    Text("Send Image")
                }
                .disabled(selectedImage == nil)
                .padding()
                
                if uploadSucsess {
                    Text("Image sent successfully!")
                        .foregroundColor(.green)
                }
                
            }
            .frame(maxWidth: .infinity)
            
            ScrollView {
                
                
                
                VStack{
                    
                    
                    Picker("What is your favorite color?", selection: $type) {
                        Text("fishing gear")
                            .tag(1)
                        
                        
                        
                        Text("bait fish")
                            .tag(2)
                        
                        
                    }
                    
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
                    .background(
                        
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color("SecondaryBlue")) // Black background
                            .frame(height: 30) // Adjust height as needed
                            .padding(.horizontal)
                        
                    )
                    
                    
                }
                
                
                HStack{
                    VStack{
                        
                        
                        TextField("Name of product", text: $name)
                            .textInputAutocapitalization(.none)
                            .disableAutocorrection(true)
                            .frame(minWidth: 0 ,maxWidth: .infinity)
                            .padding(15)
                            .foregroundColor(Color("Primary Blue"))
                    }
                    .background(Color("SecondaryBlue"))
                    .cornerRadius(20)
                    .padding(.horizontal  )
                    VStack{
                        Text("Name of product")
                            .padding(.trailing,30)
                            .font(.system(size: 18,weight: .bold))
                            .foregroundColor(Color("Primary Blue"))
                    }
                    
                }
                HStack{
                    
                    VStack{
                        TextField("Price", text: $price)
                            .keyboardType(.decimalPad)
                            .frame(minWidth: 0 ,maxWidth: .infinity)
                            .padding(15)
                        
                    }
                    .background(Color("SecondaryBlue"))
                    .cornerRadius(20)
                    .padding(.horizontal  )
                    
                    Text("Price of product")
                        .padding(.trailing,30)
                        .font(.system(size: 18,weight: .bold))
                        .foregroundColor(Color("Primary Blue"))
                    
                    
                    
                    
                }.frame(maxWidth: .infinity)
                VStack(alignment: .leading){
                    Text(" Description")
                        .padding()
                        .font(.system(size: 22,weight: .bold))
                        .foregroundColor(Color("Primary Blue"))
                    
                    TextField("Description", text: $descrription, axis: .vertical)
                        .textInputAutocapitalization(.none)
                    
                        .disableAutocorrection(true)
                        .frame(minWidth: 0 ,maxWidth: .infinity)
                        .padding(15)
                }
                .background(Color("SecondaryBlue"))
                .cornerRadius(20)
                .padding(.horizontal  )
                
                
                
                
                Button {
                   
                     
                    sendProduct()
                   
                } label: {
                    Text("publish")
                        .font(.system(size: 20,weight: .semibold))
                        .foregroundColor(.white)
                        
                        
                        
                }
                    
                    .padding(.vertical)
                    .frame(width: 80, height: 50, alignment: .center)
                    . background(Color("Primary Blue"))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .opacity( canProssesd() ? 1 : 0.5)
                    .disabled(!(canProssesd() ))
                
                
            }.padding(.horizontal)
            
        }
        
    }
    //check if the password & email is valid
        private func canProssesd() -> Bool {
            guard let selectedImage = selectedImage,
                    !name.isEmpty,
                    !descrription.isEmpty,
                    !price.isEmpty else {
                  return false
              }
              return true
          }
            
   

     func sendProduct() {
            // Call the first function with a completion handler
         uploadImage {
                // This closure will be executed once the first function is completed
                self.publish()
            }
        }

    func uploadImage(completion: @escaping () -> Void) {
        // Simulate a long-running task
        print("First function started")
        DispatchQueue.global().async {
            if let image = self.selectedImage {
                uploadImage(image: image)
                print("First function completed")
                
                // Call the completion handler once the first function is completed
                DispatchQueue.main.async {
                    completion()
                }
            }
        }
    }
         func publish() {
             addProductVM.name=name
             addProductVM.description=descrription
             addProductVM.price = Double(price) ?? 0.0
             addProductVM.category = type
             
             addProductVM.addProduct()
             print("fuunc publish")
        }
    

    func uploadImage(image: UIImage  ) {
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
                                addProductVM.imageURL =  String(decodedResponse.url)
                                print("Image URL: \(decodedResponse.url)")
                                
                                DispatchQueue.main.async {
                                    self.uploadSucsess = true
                                }
                            } catch {
                                print("Error decoding response: \(error)")
                            }
                        }
                    }
                }
                task.resume()
            }
    
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}




/*
 let task = URLSession.shared.dataTask(with: request) { data, response, error in
     if let error = error {
         print("Error: \(error)")
     } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
         if let responseData = data {
             // Handle your response data here
             print("Response Data: \(responseData)")
             DispatchQueue.main.async {
                 self.uploadSuccess = true
             }
         }
     }
 }
 
 */
