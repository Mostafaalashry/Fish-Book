//
//  AddFishView.swift
//  Fish Book
//
//  Created by mostafa on 15/06/2024.
//

import SwiftUI

struct AddFishView: View {
    
    
    @State private var imageURL: String = ""
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State private var uploadSucsess = false
    @State private var content: String = ""
   
    @State private var showAlert: Bool = false
    @State private var alertMessege: String = "ok"
    @Environment(\.dismiss) var dismiss
   
    @StateObject private var addFishVM = AddFishViewModel()
    @State private var fishDetailsList: [FishDeetailsUI] = []
    @State var numberOfArrayDescription : Int = 1

    var body: some View {
       
            
    ScrollView{
            HStack{
                Spacer()
               // Spacer()

                Text(" Add Fish")
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
                    
                    addFishVM.name = content
                    addFishVM.fishDetails = convertToFishDetailsArray(fishDetailsUIList: fishDetailsList)
                   
                    addFishVM.addFish()
                    showAlert = true
                    alertMessege = "the fish added Successfully"
                   
                    
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
                    HStack{
                       Text("Name of fish : ")
                            .font(.system(size: 17,weight: .bold))
                            .foregroundColor(Color("Primary Blue"))
                            
                        
                        TextField("Name", text: $content, axis: .vertical)
                            .textInputAutocapitalization(.none)
                        
                            .disableAutocorrection(true)
                            .frame(minWidth: 0 ,maxWidth: .infinity)
                            .padding(15)
                            .foregroundColor(Color("Primary Blue"))
                            .multilineTextAlignment(.leading)
                        
                    }
                   
             
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
              
        VStack {
                    ScrollView {
                        ForEach($fishDetailsList) { $fishDetail in
                            VStack {
                                HStack{
                                    Text("Header")
                                    TextField("Header", text: $fishDetail.header)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .padding()
                                }
                                HStack{
                                    Text("content")
                                    VStack {
                              TextEditor(text: $fishDetail.content)
                                        .frame(minHeight: 100) // Set a minimum height for
                                        .padding(15)
                                     //   .border(Color.gray, width: 1)
                                        .foregroundColor(Color("Primary Blue"))
                                        .background(Color(.systemGray6))
                                                 .cornerRadius(8)
                                        
                                   }
                                    
                                        
                                }
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color("Primary Blue"))
                           
                                
                               
                            }
                            .padding()
                        }
                    }
            
            
            Button {
                addNewFishDetails()
                
                
                let fishDetailsArray = convertToFishDetailsArray(fishDetailsUIList: fishDetailsList)
                
                               
            
            } label: {
                Text("Add Fish Details")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
           
                
               }
            .padding()

                  
                   
                }
   
           .edgesIgnoringSafeArea(.all)
            .ignoresSafeArea(.all)
        
        .padding()
            
          }
        .alert(alertMessege, isPresented: $showAlert) {
            Button("ok",role: .cancel) {
                if alertMessege == "the fish added Successfully" {
                  dismiss()
                }
                
            }
        }message: {
            Text("")
         }
        }
    private func convertToFishDetailsArray(fishDetailsUIList: [FishDeetailsUI]) -> [FishDeetails] {
            return fishDetailsUIList.map { FishDeetails(header: $0.header, content: $0.content) }
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
                        addFishVM.imageUrl = imageurl
                    case .failure(let erorr):
                        print(erorr.localizedDescription)
                    }
                }
               
                
                // Call the completion handler once the first function is completed
                
                    completion()
                
            }
      //  }
     }
    
    private func addNewFishDetails() {
           let newFishDetails = FishDeetailsUI(header: "", content: "")
           fishDetailsList.append(newFishDetails)
        print(fishDetailsList)
       }
}

struct AddFishView_Previews: PreviewProvider {
    static var previews: some View {
        AddFishView()
    }
}
