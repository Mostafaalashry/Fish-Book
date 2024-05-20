//
//  AddPostView.swift
//  Fish Book
//
//  Created by mostafa on 18/05/2024.
//

import SwiftUI

struct AddPostView: View {
    let date  = Date()
    @State private var price: String = ""
    @State private var imageURL: String = ""
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State private var uploadSucsess = false
    @State private var content: String = ""
   
    @State private var showAlert: Bool = false
    @State private var alertMessege: String = "ok"
    @Environment(\.dismiss) var dismiss
   
    @StateObject private var addPostVM = AddPostViewModel()

    var body: some View {
       
            
        VStack{
            HStack{
                Spacer()
               // Spacer()

                Text(" Add post")
                    .font(.system(size: 28,weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(
                        
                        LinearGradient(
                            colors: [.red, Color("Primary Blue")],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .padding(.leading,30)
                
                Spacer()
                Button {
                    
                    addPostVM.content = content
                    addPostVM.addPost()
                    showAlert = true
                    alertMessege = "the post added Successfully"
                   
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25 , height: 25 , alignment: .center)
                        .foregroundColor(Color.blue)
                }
                .opacity( canProssesd() ? 1 : 0.5)
                .disabled(!(canProssesd() ))
                
                
                .padding(.trailing ,10)

              
                
            }
            .padding(.horizontal,20)
            VStack(alignment: .leading){
                /*
                 Text(" ")
                 .padding()
                 .font(.system(size: 22,weight: .bold))
                 .foregroundColor(Color("Primary Blue"))
                 */
                
              
               
                VStack{
                    TextField("Say something", text: $content, axis: .vertical)
                        .textInputAutocapitalization(.none)
                    
                        .disableAutocorrection(true)
                        .frame(minWidth: 0 ,maxWidth: .infinity)
                        .padding(15)
                        .foregroundColor(Color("Primary Blue"))
                        .multilineTextAlignment(.leading)
                    
             
                }
            }
           // .background(Color("SecondaryBlue"))
            .cornerRadius(20)
            .padding(.horizontal ,10 )
            Spacer()
            
            if let image = selectedImage {
                HStack{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth:  UIScreen.main.bounds.width)
                    //.foregroundColor(Color("SecondaryBlue"))
                        .padding(.leading,10)
                    
                        .onAppear{
                            self.uploadImage {
                                print("mmmmmmmmm")
                            }
                        }
                    
                    
                    
                    Spacer()
                    
                }
              
                
                
            }
            
                
                VStack{
                 
                    
                    Button(action: {
                        self.isShowingImagePicker = true
                    }) {
                        HStack{
                            Text("Select Image")
                                .foregroundColor(Color("Primary Blue"))
                            Image(systemName: "photo.fill.on.rectangle.fill")
                        }
                                }
                    .padding(.bottom)
                    
                    .sheet(isPresented: $isShowingImagePicker) {
                        ImagePicker(selectedImage: self.$selectedImage)
                    }
                    Spacer()
                }
              
           
            
          }
        .alert(alertMessege, isPresented: $showAlert) {
            Button("ok",role: .cancel) {
                if alertMessege == "the post added Successfully" {
                  dismiss()
                }
                
            }
        }message: {
            Text("")
        }
        }
    func canProssesd() -> Bool{ //check if the password & email is valid
        
        return !(content.isEmpty)
    }
    func uploadImage(completion: @escaping () -> Void) {
        // Simulate a long-running task
       
       // DispatchQueue.main.async  {
            if let image = self.selectedImage {
                //"http://localhost:8080/api/image/uploadProductImage"
                WebServices().uploadImage(image: image, url: "http://localhost:8080/api/image/uploadProductImage") { result in
                    switch result {
                    case .success(let imageurl):
                        addPostVM.imageUrl = imageurl
                    case .failure(let erorr):
                        print(erorr.localizedDescription)
                    }
                }
               
                
                // Call the completion handler once the first function is completed
                
                    completion()
                
            }
      //  }
    }
    }

/*
 
 struct AddPostView_Previews: PreviewProvider {
     static var previews: some View {
         AddPostView()
     }
 }
 */

