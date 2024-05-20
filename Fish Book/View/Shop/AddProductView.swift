//
//  ImageAPIEX.swift
//  Fish Book
//
//  Created by mostafa on 16/03/2024.
import SwiftUI



struct AddProductView: View {
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State private var uploadSucsess = false
    @State private var text: String = ""
    @State private var type: Int = 1
    @State private var showAlert: Bool = false
    @State private var descrription: String = ""
    @State private var name: String = ""
    @State private var price: String = ""
    @State private var imageURL: String = ""
    @Environment(\.dismiss) var dismiss

    
    @State private var alertMessege: String = "ok"
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
                    HStack{
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130 , height: 130 , alignment: .leading)
                        //.foregroundColor(Color("SecondaryBlue"))
                            .padding(.leading,10)
                            
                            .onAppear{
                                self.uploadImage {
                                    print(addProductVM.imageURL+"mmmmmmmmm")
                                }
                                }
                            
                           
                        
                        Spacer()
                        
                    }
                    .padding(.leading,30)
                        
                    
                }
                
                else {
                    // Text("No image selected")
                    HStack{
                        
                        VStack{
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130 , height: 130 , alignment: .leading)
                                .foregroundColor(Color("SecondaryBlue"))
                                .padding(.leading,5)
                            
                            Button(action: {
                                self.isShowingImagePicker = true
                            }) {
                                Text("Select Image")
                                    .foregroundColor(Color("Primary Blue"))                }
                            .padding(.bottom)
                            
                            .sheet(isPresented: $isShowingImagePicker) {
                                ImagePicker(selectedImage: self.$selectedImage)
                            }
                        }
                        Spacer()
                        
                    }
                    .padding(.leading,30)
                }
                
                
               
                /*
                Button(action: {
                    // Call API to upload image here
                    if let image = self.selectedImage {
                      //  uploadImage(completion: image)
                    }else{
                        print("uploadImage doesnot pegin")
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
                
                */
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
                    .padding()
                   
                   
                    .background(
                        
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color("SecondaryBlue")) // Black background
                            .frame(height: 30) // Adjust height as needed
                            .padding(.horizontal)
                        
                    )
                    .padding(.horizontal,8)
                    
                }
                
                
                VStack{
                    HStack{
                        Text("Name of product")
                            .padding(.trailing,30)
                            .font(.system(size: 18,weight: .bold))
                            .foregroundColor(Color("Primary Blue"))
                        Spacer()
                    }
                    .padding(.leading,25)
                    
                    
                    VStack{
                        
                        
                        TextField("Name of product", text: $name)
                            .textInputAutocapitalization(.none)
                            .disableAutocorrection(true)
                            .frame(minWidth: 0 ,maxWidth: .infinity)
                            .padding(15)
                            .foregroundColor(Color("Primary Blue"))
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color("Primary Blue"))
                    }
                  //  .background(Color("SecondaryBlue"))
                    .cornerRadius(20)
                    .padding(.horizontal ,7  )
                    
                    
                }
                HStack{
                    
                    VStack{
                      
                        HStack{
                            Text("Price of product")
                                
                                .font(.system(size: 18,weight: .bold))
                                .foregroundColor(Color("Primary Blue"))
                            Spacer()
                           
                        }
                        .padding(.leading,15)
                        .padding(.top,15)
                        
                        TextField("Price", text: $price)
                            .keyboardType(.decimalPad)
                            .frame(minWidth: 0 ,maxWidth: .infinity)
                            .padding(15)
                            .foregroundColor(Color("Primary Blue"))
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color("Primary Blue"))
                        
                    }
                   // .background(Color("SecondaryBlue"))
                    .cornerRadius(20)
                    .padding(.horizontal ,10 )
                    
                   
                    
                    
                    
                    
                }.frame(maxWidth: .infinity)
                VStack(alignment: .leading){
                    /*
                     Text(" ")
                     .padding()
                     .font(.system(size: 22,weight: .bold))
                     .foregroundColor(Color("Primary Blue"))
                     */
                    
                    HStack{
                        Text("Description")
                        
                            .font(.system(size: 18,weight: .bold))
                            .foregroundColor(Color("Primary Blue"))
                        Spacer()
                        
                    }
                    .padding(.leading,15)
                    .padding(.top,15)
                    VStack{
                        TextField("Description", text: $descrription, axis: .vertical)
                            .textInputAutocapitalization(.none)
                        
                            .disableAutocorrection(true)
                            .frame(minWidth: 0 ,maxWidth: .infinity)
                            .padding(15)
                            .foregroundColor(Color("Primary Blue"))
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color("Primary Blue"))
                    }
                }
               // .background(Color("SecondaryBlue"))
                .cornerRadius(20)
                .padding(.horizontal ,10 )
                
                
                
                
                Button {
                    if addProductVM.imageURL == ""{
                        uploadImage {
                               // This closure will be executed once the first function is completed
                               self.publish()
                           }
                    }
                    else{
                        self.publish()
                    }
                    //sendProduct()
                   
                } label: {
                    Text("publish")
                        
                        .font(.system(size: 20,weight: .semibold))
                        .foregroundColor(.white)
                        
                        
                        
                }
                    
                    
                    .frame(width: 315, height: 45, alignment: .center)
                    . background(Color("Primary Blue"))
                    .cornerRadius(6)
                    .padding(.horizontal)
                    .opacity( canProssesd() ? 1 : 0.5)
                    .disabled(!(canProssesd() ))
                    .padding(.vertical,30)
                    .padding(.bottom , 25)
                
            }.padding(.horizontal)
            
        }
       
        .alert(alertMessege, isPresented: $showAlert) {
            Button("ok",role: .cancel) {
                if alertMessege == "the prroduct added Successfully" {
                    dismiss()
                }
                
            }
        }message: {
            Text("")
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
            
   
    

    func uploadImage(completion: @escaping () -> Void) {
        // Simulate a long-running task
       
       // DispatchQueue.main.async  {
            if let image = self.selectedImage {
                //"http://localhost:8080/api/image/uploadProductImage"
                WebServices().uploadImage(image: image, url: "http://localhost:8080/api/image/uploadProductImage") { result in
                    switch result {
                    case .success(let imageurl):
                        addProductVM.imageURL = imageurl
                    case .failure(let erorr):
                        print(erorr.localizedDescription)
                    }
                }
               
                
                // Call the completion handler once the first function is completed
                
                    completion()
                
            }
      //  }
    }
    
         func publish() {
            
             if addProductVM.imageURL != "" {
                 addProductVM.name=name
                 addProductVM.description=descrription
                 addProductVM.price = Double(price) ?? 0.0
                 addProductVM.category = type
                 print(" \(addProductVM.imageURL)...imageURL")
                 print(" \(addProductVM.description)...")
                 print(" \(addProductVM.name)...")
                 print(" \(addProductVM.price)...")
                 addProductVM.addProduct()
                 showAlert = true
                 alertMessege = "the prroduct added Successfully"
             }
             else
             {
                
                 alertMessege = "error connection please check the internet"
                 showAlert = true
             }
            
             
             
        }
    

    
    
}
/*
struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
*/


