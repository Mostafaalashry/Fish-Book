//
//  FriendPrroductItemView.swift
//  Fish Book
//
//  Created by mostafa on 10/06/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct FriendPrroductItemView: View {
    let product  :ProductModel
    @EnvironmentObject var vm : FriendPrroductViewModel
    @State  var showAlert = false

    var body: some View {
        
            HStack(spacing: 0){
                VStack(alignment: .leading , spacing: 0){
                  
                    Text( product.updatedOn?.prefix(10) ?? product.createdOn.prefix(10))
                        .font(.system(size: 16,weight: .light,design: .default))
                        //.foregroundColor(Color("Primary Blue"))
                        .padding(.leading)
                        .padding(.top)
                        Text(product.title)
                            .font(.system(size: 20,weight: .bold,design: .serif))
                            .foregroundColor(Color("Primary Blue"))
                            .padding(.leading)
                    
                    
                    Text(product.content)
                        .font(.system(size: 12,weight: .light,design: .default))
                        .padding(.horizontal)
                        .padding(.top,5)

                    Text("$ " + String(product.price))
                        .font(.system(size: 16,weight: .bold,design: .serif))
                        .padding(.leading)
                        .padding(.top,5)

                }
                Spacer()
              //  Image(product.imageUrl)
                WebImage(url: URL(string: product.imageUrl?.replacingOccurrences(of: "http://", with: "https://") ?? ""))

                    .resizable()
                    .frame(width: 150 , height: 150 ,alignment: .center)
                    .scaledToFit()
                    .cornerRadius(12)
                    

            }
            .padding()
            .frame(width: UIScreen.main.bounds.width/1.1 ,alignment: .center)
            
           // .background(Color.white.cornerRadius(12).shadow(color: Color.blue,radius: 20))
            .background(Color.white.cornerRadius(12).shadow(color: Color("Primary Blue").opacity(0.4), radius: 10))
            .alert(isPresented: $showAlert) {
                      Alert(
                          title: Text("Report"),
                          message: Text("Are you sure do you want to send a report."),
                          primaryButton: .default(Text("OK")) {
                       
                              
                              vm.report(id: Int(product.id))
                            
                          },
                          secondaryButton: .cancel(Text("Cancel")) {
                             
                          }
                      )
                  }
            .overlay(
               
                Menu(content: {
                    Button {
                        showAlert = true
                       
                    } label: {
                        
                        Text("Report")
                            .foregroundColor(Color.red)
                    }
                   

                }, label: {
                   Image(systemName: "ellipsis")
                        .padding()
                })
            
                ,alignment: .topLeading
                    
            )
            
            .edgesIgnoringSafeArea(.all)
            .ignoresSafeArea(.all)
    }
   
}

