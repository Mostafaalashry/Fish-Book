//
//  UpdateUserInfo.swift
//  Fish Book
//
//  Created by mostafa on 28/04/2024.
//

import SwiftUI

struct UpdateUserInfoView: View {
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State private var uploadSucsess = false
    @State private var bio: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var phone: String = ""
    @State private var addrress: String = ""
    @State private var birthdate: String = ""
    @State private var imageURL: String = ""
    @State private var alertMessege: String = "ok"
    @State private var showAlert: Bool = false
    
    @StateObject private var userUpdatedVM = UpdateUserInfoViewModel()
    
    @State var selectedDate: Date = Date()
    

    var body: some View {
        ScrollView{
            VStack{
                Text("update information")
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
                            .frame(width: 90, height: 90, alignment: .center)
                            .cornerRadius(60)
                            .clipped()
                            .padding()
                            .onAppear{
                                self.uploadImage {
                                    print(userUpdatedVM.imageUrl+"mmmmmmmmm")
                                }
                                }
                           
                        
                        Spacer()
                        
                    }
                    .padding(.leading,15)
                } else {
                    // Text("No image selected")
                    HStack{
                        
                        VStack{
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 90, height: 90, alignment: .center)
                                .cornerRadius(60)
                                .clipped()
                                .padding()
                                .foregroundColor(Color("gray2"))
                            
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
                    .padding(.leading,15)
                }
                
                
               
                
            }
            .frame(maxWidth: .infinity)
            HStack{
                VStack{
                    HStack{
                        Text("First Name")
                            .padding(.trailing,30)
                            .font(.system(size: 18,weight: .bold))
                            .foregroundColor(Color("Primary Blue"))
                        Spacer()
                    }
                    .padding(.leading,25)
                    
                    
                    VStack{
                        
                        
                        TextField("First Name", text: $firstName)
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
                VStack{
                    HStack{
                        Text("Last Name")
                            .padding(.trailing,30)
                            .font(.system(size: 18,weight: .bold))
                            .foregroundColor(Color("Primary Blue"))
                        Spacer()
                    }
                    .padding(.leading,25)
                    
                    
                    VStack{
                        
                        
                        TextField("Last Name", text: $lastName)
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
            }
            .padding(.top)
            HStack{
                
                VStack{
                  
                    HStack{
                        Text("Phone")
                            
                            .font(.system(size: 18,weight: .bold))
                            .foregroundColor(Color("Primary Blue"))
                        Spacer()
                       
                    }
                    .padding(.leading,15)
                    .padding(.top,15)
                    
                    TextField("Phone", text: $phone)
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
               
                
                HStack{
                    Text("bio")
                    
                        .font(.system(size: 18,weight: .bold))
                        .foregroundColor(Color("Primary Blue"))
                    Spacer()
                    
                }
                .padding(.leading,15)
                .padding(.top,15)
                VStack{
                   
                    TextField("bio", text: $bio ,axis: .vertical)
                        
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
            
            VStack {
                DatePicker("Select a birth Date",
                                  selection: $selectedDate,
                                  in:  ...Date(),
                                  displayedComponents: [.date]
                                  
                       )
                
                       .datePickerStyle(.compact)
                       .environment(\.locale , .init(identifier: "en"))
                       
                     //   Text("Date is \(selectedDate,formatter: dateFormatter)")
                     .onChange(of: selectedDate){ newValue in
                        birthdate = dateFormatter.string(from: selectedDate)

                    }
                    // .padding(.trailing,30)
                     .font(.system(size: 18,weight: .bold))
                     .foregroundColor(Color("Primary Blue"))
                Text(birthdate)
              
                    }
            
            .padding()
            .padding(.horizontal)
            .foregroundColor(Color("Primary Blue"))
            
            Button {
                
                uploadUserInfo()
                
            } label: {
                Text("Update")
                    
                    .font(.system(size: 20,weight: .semibold))
                    .foregroundColor(.white)
                    
                    
                    
            }
                
                
                .frame(width: 340, height: 45, alignment: .center)
                . background(Color("Primary Blue"))
                .cornerRadius(6)
               // .padding(.horizontal)
                .padding(.vertical,30)
                .padding(.bottom , 25)

          //  Spacer()
        }
        .alert(alertMessege, isPresented: $showAlert) {
            Button("ok",role: .cancel) {
                if alertMessege == "the prroduct added Successfully" {
                   // showingPopover = false
                }
                
            }
        }message: {
            Text("")
        }
    }
    private var dateFormatter : DateFormatter{
        let formater  = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd"
        return formater
    }
    
    func uploadImage(completion: @escaping () -> Void) {
        // Simulate a long-running task
       
        DispatchQueue.main.async  {
            if let image = self.selectedImage {
                
                WebServices().uploadImage(image: image, url: "http://localhost:8080/api/image/uploadUserImage") { result in
                    switch result {
                    case .success(let imageurl):
                        userUpdatedVM.imageUrl = imageurl
                    case .failure(let erorr):
                        print(erorr.localizedDescription)
                    }
                }
               
                
                // Call the completion handler once the first function is completed
                
                    completion()
                
            }
        }
    }
    
         func publish() {
             userUpdatedVM.firstname=firstName
             userUpdatedVM.lastname=lastName
             userUpdatedVM.bio=bio
             userUpdatedVM.birthdate=birthdate
             userUpdatedVM.address=addrress
             userUpdatedVM.phone=Int64(phone) ?? 0
                 if selectedImage != nil {
                     if userUpdatedVM.imageUrl != ""{
                         
                     
                         
                 
                         
                         userUpdatedVM.uploadUserInfo()
                         
                         alertMessege = "your information uploaded Successfully"
                         showAlert = true
                     }
                     else
                     {
                         
                         alertMessege = "error connection please check the internet"
                         showAlert = true
                     }
                 }
             else {
                 userUpdatedVM.uploadUserInfo()
             }
             
             print(" \(userUpdatedVM.imageUrl)...imageURL")
             print(" \(userUpdatedVM.firstname)...")
             print(" \(userUpdatedVM.bio)...")
             print(" \(userUpdatedVM.birthdate)...")
             
        }
    func uploadUserInfo(){
      
        
        if selectedImage != nil {
            if userUpdatedVM.imageUrl  != ""{
                publish()
            }
            else
            {
                uploadImage {
                    
                }
            }
                
           
        }
        else {
          
            userUpdatedVM.imageUrl=""
            
           
            
            publish()
            
            
            
        }
        
    }
    
    
    
}

struct UpdateUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateUserInfoView()
    }
}
