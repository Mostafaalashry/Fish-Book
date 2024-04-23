//
//  RegestrationView.swift
//  Fish Book
//
//  Created by mostafa on 06/02/2024.
//

import SwiftUI

struct RegestrationView: View {
    @State private var emailTextt = ""
    @State private var passworrdText = ""
    
    @State private var firstName = ""
    @State private var lastName = ""
   
    @State private var alertsucces :Bool = false
    @State private var alertfailled :Bool = false

    
    @State private var ConfirmpassworrdText = ""

    @State private var isValidEmail = true
    @State private var validFirstName = true
    @State private var validLastName = true


    @State private var isValidPassword = true
    @State private var isValidConfirmPassword = true
    @State private var nextView = false
    @State private var isSecured = true
    @StateObject private var signUpVM = SignUpViewModel()
   // @State private var isauthenticated = signUpVM.isAuthenticated



    @FocusState private var focusedFielf:FocuseedField?
    
  func firstAndLastIsNotEmpty() -> Bool{ //check if the password & email is valid
      if (firstName.isEmpty && lastName.isEmpty){
          return false
          
      }
      else{return true}
       
    }
    
  func canProssesd() -> Bool{ //check if the password & email is valid
        
       return Validator.validateEmail(emailTextt)&&Validator.validatePassword(passworrdText)
    }
    

    var body: some View {
        NavigationStack{
            VStack{
                
                    // 1
                    Text("Create Account").font(Font.system(size: 46, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(

                        LinearGradient(
                            colors: [.red, Color("Primary Blue")],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                 
                    .padding(.vertical)
                    .padding(.bottom)
                         
                
                HStack(spacing: 20){
                    VStack{
                        TextField("First Name", text: $firstName)
                            
                            .padding()
                            .background(Color("SecondaryBlue"))
                            .cornerRadius(12)
                            .keyboardType(.alphabet)
                            .focused($focusedFielf, equals: .firstName)
                           // .focused($focusedFielf , equals: .firstName)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(!validFirstName ?.red : focusedFielf == .firstName ? Color("Primary Blue") : .white,lineWidth: 3)
                                
                            )
                           // .padding(.bottom,1)
                       // .padding(.horizontal)
                            .onChange(of: firstName) { newValue in
                                validFirstName = Validator.isValidName( newValue)
                            }
                            .padding(.bottom, validFirstName ? 16:0)
                        if !validFirstName{
                            HStack{
                                Text("your firrst name is empty")
                                    .font(.system(size: 12))
                                
                                    .foregroundColor(.red)
                                    .padding(.leading)
                                Spacer()
                            }
                                .padding(.bottom)
                                
                        }
                        
                    }
                    
                    
                    
                    VStack{
                        TextField("last Name", text: $lastName)
                            
                            .padding()
                            .background(Color("SecondaryBlue"))
                            .cornerRadius(12)
                            .keyboardType(.alphabet)
                            .focused($focusedFielf, equals: .lastName)
                           // .focused($focusedFielf , equals: .firstName)
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(!validLastName ?.red : focusedFielf == .lastName ? Color("Primary Blue") : .white,lineWidth: 3)
                                
                            )
                           // .padding(.bottom,1)
                       // .padding(.horizontal)
                            .onChange(of: lastName) { newValue in
                                validLastName = Validator.isValidName( newValue)
                            }
                            .padding(.bottom, validLastName ? 16:0)
                        if !validLastName{
                            HStack{
                                Text("your last name is empty")
                                    .font(.system(size: 12))
                                
                                    .foregroundColor(.red)
                                    .padding(.leading)
                                Spacer()
                            }
                                .padding(.bottom)
                                
                        }
                        
                    }

                    
                    
                }
                    .padding(.horizontal)
                
                /*
                Text("createe an account so you can explore all the \n existin jops")
                    .font(.system(size: 15))
                    .padding(.bottom)
                    .multilineTextAlignment(.center)
                
                    //email text field
               
                    TextField("Enter the email", text: $emailTextt)
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
                */
                EmailTextField(emailTextt: $emailTextt, isValidEmail: $isValidEmail)
                
                //end of email teext field
                
                
                
                
                //password text field
                /*
                SecureField("enter the password ",text: $passworrdText)
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
                        Text("your password is not valid ")
                            .font(.system(size: 14))
                            .padding(.leading)
                            .foregroundColor(.red)
                        Spacer()
                    }.padding(.bottom)
                }
                */
                PasswordText(passworrdText: $passworrdText, errorrpassworrdText: "password is not valid", placeHolder: "enter the password", isValidPassword: $isValidPassword , isSecured: $isSecured).padding(.bottom)
                
                
                
                //END password text field
                
                //confifm password text
                /*PasswordText(passworrdText: $ConfirmpassworrdText, errorrpassworrdText: "password is not matching", placeHolder: "Confirm the password", isValidPassword: $isValidPassword).padding(.vertical)
                
*/
                Button {
                    signUpVM.firstname = firstName
                    signUpVM.lastname = lastName
                    signUpVM.email = emailTextt
                    signUpVM.password = passworrdText
                   
                    signUpVM.SignUp()
                    alertsucces = !signUpVM.isAuthenticated
                    
                    if !alertsucces{
                        alertfailled = true
                    }
                    
                 //   AllowNotificationView()
                    //action
                } label: {
                    Text("sign up")
                        .font(.system(size: 25,weight: .semibold))
                        .foregroundColor(.white)
                        
                }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    . background(Color("Primary Blue"))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .opacity( canProssesd()&&firstAndLastIsNotEmpty() ? 1 : 0.5)
                    .disabled(!(canProssesd() && firstAndLastIsNotEmpty()))
                    .padding(.top)

                
                Button {
                    nextView.toggle()
                    
                    //action
                } label: {
                    Text("Already have an account")
                        .font(.system(size: 20,weight: .semibold))
                        .foregroundColor(Color("gray"))
                        .padding(.top)
                        
                        
                }.padding(.top)
                    
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                
                ContinueLoginView(googleAction: {}, faceebookAction: {}, applleAction: {}) // is a view

                
               
                    
            }.alert("the account created Succssefully", isPresented: $alertsucces) {
                
                Button("OK", role: .cancel) {
                    nextView.toggle()
                }
            }
            .alert("blease try again later", isPresented: $alertfailled) {
                
                Button("OK", role: .cancel) {
                   
                }
            }
            .navigationDestination(isPresented: $nextView) {
                LoginView()
               
            }
            
            

          //  .alert("please try again ", isPresented: $alertsucces) {
                
        //    }

        }

    }
}

struct RegestrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegestrationView()
    }
}
