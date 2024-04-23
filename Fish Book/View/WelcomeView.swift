//
//  ContentView.swift
//  Fish Book
//
//  Created by mostafa on 06/02/2024.
//

import SwiftUI
import Lottie


enum viewStack{
    
    case login
    case registration
    
    case createNewAccount
    case maintTab
   // case forgetPassword
   // case createAccount
}

struct WelcomeView: View {
    @State private var preseentNextView=false
    @State private var nextview:viewStack = .login
    @State private var showSplash = true

    
    var body: some View {
        

        NavigationStack{
            
            ZStack{
                if showSplash {
                    SplashScreenView()
                        .transition(.opacity)
                        .animation(.easeOut(duration: 2.5))
                }
                else{
               
                VStack {
                    
                    
                    
                    LottieView(animationFileName: "lottie-Animation-1 -", loopMode: .loop)
                        .frame(maxWidth: .infinity,maxHeight: 320,alignment:.leadingLastTextBaseline)
                        .padding(.leading)
                    //  Image("firstScreen2")
                    //                           .resizable()
                    //                             .scaledToFit()
                    //                             .frame(width: 390)
                    //                             .padding(24)
                    
                    
                    Text("Learn Fishing \n Professionally")
                        .font(.system(size: 38,weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(

                            LinearGradient(
                                colors: [.red, Color("Primary Blue")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .padding(.bottom)
                    
                    
                    VStack(spacing: 0){
                        Text("find fishing spots and local info. ")
                            .font(.system(size: 14,weight: .regular))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .padding(.bottom,8)
                        Text("Trusted By millions of angelars.")
                            .font(.system(size: 14,weight: .regular))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .padding(.bottom,8)
                    }
                    Spacer()
                    Spacer()
                    
                    HStack(spacing: 10){
                        Button{
                            //action
                            nextview = .login
                            preseentNextView.toggle()
                            
                            
                        }label: {
                            Text("Login")
                                .font(.system(size: 20,weight: .semibold)).foregroundColor(.white)
                        }
                        .frame(width: 160,height: 60)
                        .background(Color("Primary Blue"))
                        .cornerRadius(10)
                        Button{
                            nextview = .registration
                            preseentNextView.toggle()
                            
                        }label: {
                            Text("register")      .font(.system(size: 20,weight: .semibold)).foregroundColor(.black)
                                .frame(width: 160,height: 60)
                            
                                .background(LinearGradient(gradient: Gradient(colors: [.red, Color("Primary Blue")]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(10)
                            
                        }
                        
                    }
                    
                    Spacer()
                    Spacer()
                    
                }
                .padding()
                .navigationDestination(isPresented: $preseentNextView) {
                    switch nextview {
                    case .login:
                        LoginView()
                    case .registration:
                        RegestrationView()
                    case .createNewAccount:
                        RegestrationView()
                    case .maintTab:
                       MainTapp()
                    }
                    // ("nextview ")
                }
                }
                
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                    withAnimation {
                        self.showSplash = false
                    }
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}






    
 
 
    
     

