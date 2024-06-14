//
//  ReportedProductItemView.swift
//  Fish Book
//
//  Created by mostafa on 15/06/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReportedProductItemView: View {
    let product : ReportedProductModel
   
    
    @State  var showAlert = false
    @State  var messege = ""
    @State  var deletePost = false
    @State  var deleteReports = false
    
    @EnvironmentObject var vm  : ReportedProductViewModel

    var body: some View {
        VStack(spacing: 0){
            // WebImage(url: URL(string: product.imageUrl.replacingOccurrences(of: "http://", with: "https://") ?? ""))
            
            if product.publisherImage == nil || product.publisherImage == "" {
                HStack{
                   Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40,height: 40)
                        .foregroundColor(Color("lightgray 1"))
                        .clipShape(Circle())
                    
                    Text(product.publisherName)
                    Spacer()
                    
                }
                .padding(.leading ,12)
            }
            else
            {
                HStack{
                    WebImage(url: URL(string: product.publisherImage!.replacingOccurrences(of: "http://", with: "https://") ?? ""))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40,height: 40)
                        .foregroundColor(Color("gray"))
                        .clipShape(Circle())
                    
                    Text(product.publisherName)
                    Spacer()
                    
                }
                .padding(.leading ,12)
            }
            

           
                
         
            
            HStack{
                VStack(alignment: .leading , spacing: 0){
                    
                    Text("Name : \(product.title)")
                    Text("price : \(product.price)")
                    
                    
                   
                  
                    Text(product.content)
                        .padding(.top)
                        .multilineTextAlignment(.leading)
          
                }
                .padding()
                .frame(alignment: .leading)
                Spacer()
                
            }
            .frame(alignment: .leading)
           
            if product.imageUrl != nil && product.imageUrl != ""  {
                WebImage(url: URL(string: product.imageUrl!.replacingOccurrences(of: "http://", with: "https://") ?? ""))
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth:  UIScreen.main.bounds.width)
            }
           
            
           
                HStack{
                    Text(" number of report \(product.numberOfReports)")
                    
                    Image(systemName: "bookmark.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 10,height: 10)
                       
                   
                       
                }
                
          
            .padding(.top,8)
            Rectangle()
                .frame(height: 0.7)
                .foregroundColor(Color.black)
                .padding(.vertical)
            
            HStack {
               
                
                Button {
                    messege = "Are you sure that do you want to delete this product"
                    deletePost = true
                    showAlert = true
                } label: {
                    Text("Delete product" )
                    
                     .font(.system(size: 18,weight: .bold,design: .serif))
                     .frame( height: 50, alignment: .center)
                     .padding(.horizontal)
                     .background(Color("dark1"))
                     .cornerRadius(15)
                    
                }
                
                Button {
                    messege = "Are you sure that do you want to delete this all report for this product"
                    deleteReports = true
                    showAlert = true
                    
                } label: {
                    Text("Delete the report" )
                       
                        .font(.system(size: 18,weight: .bold,design: .serif))
                        .frame( height: 50, alignment: .center)
                        .padding(.horizontal)
                        .background(Color("dark1"))
                        .cornerRadius(15)
                    
                }

                
                
            }
            .padding()
            .padding(.horizontal)
            
        }
        .padding(.top)
        .background(Color.white)
        .frame(maxWidth:  UIScreen.main.bounds.width)
        .alert(isPresented: $showAlert) {
                  Alert(
                      title: Text("Delete"),
                      message: Text(messege),
                      primaryButton: .default(Text("OK")) {
                   
                          if deletePost{
                              
                              
                              vm.deleteMyPost(prroduct: product, apiString: "http://localhost:8080/api/products/admin/delete/\(product.id)")
                              
                              
                              
                          }
                          if deleteReports{
                              
                            
                              vm.deleteMyPost(prroduct: product, apiString: "http://localhost:8080/api/products/admin/reports/delete/\(product.id)")
                              
                              
                              
                              
                              
                              
                          }
                       
                        
                      },
                      secondaryButton: .cancel(Text("Cancel")) {
                         
                      }
                  )
              }
        //.padding(.vertical)
       
        
       // .edgesIgnoringSafeArea(.all)
       //     .ignoresSafeArea(.all)
    }
}
