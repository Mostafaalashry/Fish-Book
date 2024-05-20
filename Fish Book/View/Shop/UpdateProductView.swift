//
//  UpdateProductView.swift
//  Fish Book
//
//  Created by mostafa on 23/04/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct UpdateProductView: View {
    let product:MyProductModel
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State private var uploadSucsess = false
    @State private var text: String = ""
    @State private var type: Int64 = 1
    @State private var showAlert: Bool = false
    @State private var descrription: String
    @State private var name: String
    @State private var price: String
    @State  private var imageURL: String
   // @Binding var showingPopover:Bool
    @State private var alertMessege: String = "ok"
    @StateObject private var productUpdatedVM = UpdateProductViewModel()
    //, showingPopover: Binding<Bool>
    init(product: MyProductModel) {
          self.product = product
       // _showingPopover = showingPopover
        _imageURL = State(initialValue: product.imageUrl)
        _name = State(initialValue: product.title)
        _descrription = State(initialValue: product.content)
        _price = State(initialValue: String(product.price))
        _type = State(initialValue: product.categoryId)
       
      }
    
    
    var body: some View {
        
        VStack{
            VStack{
                Text(" Update product")
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
                                    print(productUpdatedVM.imageUrl+"mmmmmmmmm")
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
                            WebImage(url: URL(string: imageURL.replacingOccurrences(of: "http://", with: "https://") ?? ""))
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
                   // productUpdatedVM.imageUrl=imageURL
                    
                    if productUpdatedVM.imageUrl == ""{
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
                 //   showingPopover = false
                }
                
            }
        }message: {
            Text("")
        }
        
    }
    
    private func canProssesd() -> Bool {
       
             guard
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
                    productUpdatedVM.imageUrl = imageurl
                case .failure(let erorr):
                    print(erorr.localizedDescription)
                }
            }
           
            
            // Call the completion handler once the first function is completed
            
                completion()
            
        }
  //  }
}
/*
 
 */
     func publish() {
         
         if productUpdatedVM.imageUrl != "" {
              productUpdatedVM.title=name
             productUpdatedVM.content=descrription
             
             productUpdatedVM.price = Int32(Double(price) ?? 0.0)
             productUpdatedVM.categoryId = Int64(type)
             productUpdatedVM.id = Int64(self.product.id)
              print(" \(productUpdatedVM.imageUrl)...imageURL")
              print(" \(productUpdatedVM.content)...")
              print(" \(productUpdatedVM.title)...")
              print(" \( productUpdatedVM.price)...")
             
             productUpdatedVM.uploadProduct()
             
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
 struct UpdateProductView_Previews: PreviewProvider {
     static var previews: some View {
         UpdateProductView()
     }
 }
 
 */

