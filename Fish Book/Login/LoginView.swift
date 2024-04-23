//
//  LoginView.swift
//  Fish Book
//
//  Created by mostafa on 06/02/2024.
//

import SwiftUI

enum FocuseedField{
    case email
    case password
    case firstName
    case lastName
}

struct LoginView: View {
    @State private var preseentNextView=false
    @State private var nextview:viewStack = .maintTab
    @State private var emailTextt = ""
    @State private var passworrdText = ""
    @State private var errorrpassworrdText = ""
    
    @State private var showalert = false

    @StateObject private var loginVM  = LoginViewModel()
    
    @State private var isValidEmail = true
    @State private var isValidPassword = true
    @State private var isSecured = true


    @FocusState private var focusedFielf:FocuseedField?
    
    func canProssesd() -> Bool{ //check if the password & email is valid
        
        return Validator.validateEmail(emailTextt)&&Validator.validatePassword(passworrdText)
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                
                    Text("Login").font(Font.system(size: 56, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(

                        LinearGradient(
                            colors: [.red, Color("Primary Blue")],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .padding(.bottom)
                         
                
                Text("Welcome back you ,ve\n been missed!")
                    .font(.system(size: 15,weight: .semibold))
                    .padding(.bottom)
                
                   
                EmailTextField(emailTextt: $emailTextt, isValidEmail: $isValidEmail)
             
                
                
                
                
                
                PasswordText(passworrdText: $passworrdText, errorrpassworrdText: "password is not valid ", placeHolder: "Enter the password", isValidPassword: $isValidPassword , isSecured: $isSecured)
                //END password text field
                

                HStack{
                   
                    Spacer()
                    Button {
                        //action
                    } label: {
                        Text("forget the password ?   ")
                            .font(.system(size: 15 , weight: .semibold))
                            .foregroundColor(Color("Primary Blue"))
                    }.padding(.trailing)
                        .padding(.vertical)

                    
                }
                
                Button {
                   
                    loginVM.email = emailTextt
                    loginVM.password = passworrdText
                    loginVM.login()
                    if loginVM.isAuthenticated {
                        nextview = .maintTab
                        preseentNextView.toggle()
                    }
                    else {
                        showalert  = true
                    }
                   
              
                   
                } label: {
                    Text("sign in")
                        .font(.system(size: 25,weight: .semibold))
                        .foregroundColor(.white)
                        
                        
                        
                }
                    
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    . background(Color("Primary Blue"))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .opacity( canProssesd() ? 1 : 0.5)
                    .disabled(!(canProssesd() ))
                 
                 
                Button {
                    nextview = .registration
                    preseentNextView.toggle()
                    
                    //action
                } label: {
                    Text("Create a new account")
                        .font(.system(size: 20,weight: .semibold))
                        .foregroundColor(Color("gray"))
                        .padding(.top)
                        
                        
                }.padding(.top)
                    
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                
                ContinueLoginView(googleAction: {}, faceebookAction: {}, applleAction: {}) // is a view

                
               
                    
            } .navigationDestination(isPresented: $preseentNextView) {
                switch nextview {
                case .login:
                    LoginView()
                case .registration:
                    RegestrationView()
                case .createNewAccount:
                    RegestrationView()
                case .maintTab:
                    MainTapp()
                        .navigationBarBackButtonHidden(true)
                }
                    
                // ("nextview ")
            }
            .alert("the email or password is not valid", isPresented: $loginVM.showAlert) {
                Button("ok",role: .cancel) {
                    
                }
            }message: {
                Text("please tyr again")
            }
            }
        }
    }
    
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
struct ContinueLoginView:View{
    var googleAction:() -> Void
    var faceebookAction:() -> Void
    var applleAction:() -> Void

    var body: some View{
        VStack{
            Text("Or continue with").font(.system(size: 15,weight: .semibold))
                .foregroundColor(Color("gray"))
                .padding()
            
            
            HStack{
                Button {
                    googleAction()
                    //
                } label: {
                    Image("google-logo")
                }.iconButtonStyle
                Button {
                    faceebookAction()
                    //
                } label: {
                    Image("facebook-logo")
                }.iconButtonStyle
                
                Button {
                    applleAction()
                    //
                } label: {
                    Image("apple-logo")
                }.iconButtonStyle
            }

            
        }
    }
}
extension View{
    var iconButtonStyle : some View {
        self.padding()
            .background(Color("lightGray"))
            .cornerRadius(8)
    }
}
