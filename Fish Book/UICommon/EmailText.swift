//
//  EmailText.swift
//  Fish Book
//
//  Created by mostafa on 18/03/2024.
//

import SwiftUI



struct EmailTextField : View{
    @Binding var emailTextt:String
    @Binding var isValidEmail:Bool
    @FocusState private var focusedFielf:FocuseedField?
    var body:some View{
        VStack{
            TextField("Enter the email", text: $emailTextt)
               /// .textInputAutocapitalization(nil)
              //  .disableAutocorrection(true)
              //  .autocapitalization(.none)
                        
                .focused($focusedFielf , equals: .email)
                .padding()
                .background(Color("SecondaryBlue"))
                .cornerRadius(12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(!isValidEmail ?.red : focusedFielf == .email ? Color("Primary Blue") : .white,lineWidth: 3)
                    
                ).padding(.bottom,1)
            .padding(.horizontal)
                .onChange(of: emailTextt) { newValue in
                    isValidEmail = Validator.validateEmail(newValue)
                }
                .padding(.bottom, isValidEmail ? 16:0)
            if !isValidEmail{
                HStack{
                    Text("your email is not valid ")
                        .font(.system(size: 14))
                    
                        .foregroundColor(.red)
                        .padding(.leading)
                    Spacer()
                }.padding(.horizontal)
                    .padding(.bottom)
                    
            }
        }
    }
}

