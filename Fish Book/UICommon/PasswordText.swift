//
//  PasswordText.swift
//  Fish Book
//
//  Created by mostafa on 18/03/2024.
//

//import Foundation
import SwiftUI

struct PasswordText:View{
    @Binding  var passworrdText : String
    let errorrpassworrdText : String
    let placeHolder : String
    
    
    @Binding  var isValidPassword : Bool
    @Binding  var isSecured : Bool
    
    
    
    @FocusState private var focusedFielf:FocuseedField?
    
    var body: some View{
        ZStack{
            VStack{
                if isSecured{
                    SecureField(placeHolder,text: $passworrdText)
                    //    .textInputAutocapitalization(.never)
                     //   .disableAutocorrection(true)
                       
                        .padding()
                        .background(Color("SecondaryBlue"))
                        .cornerRadius(12)
                        .focused($focusedFielf,equals: .password)
                        .background(
                            RoundedRectangle( cornerRadius:12)
                                .stroke(!isValidPassword ? .red :
                                            focusedFielf == .password  ?
                                        Color  ("Primary Blue") : .white, lineWidth : 3)
                        ).padding(.horizontal)
                        .onChange(of: passworrdText) { newValue in
                            isValidPassword = Validator.validatePassword(newValue)
                        }
                    if !isValidPassword{
                        HStack{
                            Text(errorrpassworrdText)
                                .font(.system(size: 14))
                                .padding(.leading)
                                .foregroundColor(.red)
                            Spacer()
                        }.padding(.bottom)
                    }
                }
                else{
                    TextField(placeHolder,text: $passworrdText)
                    //    .textInputAutocapitalization(.never)
                     //   .disableAutocorrection(true)
                     

                        .padding()
                        .background(Color("SecondaryBlue"))
                        .cornerRadius(12)
                        .focused($focusedFielf,equals: .password)
                        .background(
                            RoundedRectangle( cornerRadius:12)
                                .stroke(!isValidPassword ? .red :
                                            focusedFielf == .password  ?
                                        Color  ("Primary Blue") : .white, lineWidth : 3)
                        ).padding(.horizontal)
                        .onChange(of: passworrdText) { newValue in
                            isValidPassword = Validator.validatePassword(newValue)
                        }
                    if !isValidPassword{
                        HStack{
                            Text(errorrpassworrdText)
                                .font(.system(size: 14))
                                .padding(.leading)
                                .foregroundColor(.red)
                            Spacer()
                        }.padding(.bottom)
                        
                    }
                    
                }
                
            }
                HStack{
                    Spacer()
                    Button{
                        self .isSecured.toggle()
                        
                    }label: {
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                            .accentColor(.gray)
                        
                    }.padding(.all)
                        .padding(.trailing)
                        .padding(!isValidPassword ? .bottom : .horizontal )
                        .padding(!isValidPassword ? .bottom : .trailing )
                    
                    
                }
                
                
                
            }
        }
    
}
