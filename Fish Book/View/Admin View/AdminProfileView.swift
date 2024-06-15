//
//  AdminProfileView.swift
//  Fish Book
//
//  Created by mostafa on 11/06/2024.
//

import SwiftUI

struct AdminProfileView: View {
    var body: some View {
        VStack{
            
                Text("Admin")
                .font(Font.system(size: 46, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("dark"))
                .padding(.top )
                .frame(alignment: .top)
                 
               Spacer()
            
            VStack {
                
                NavigationLink {
                   AllReportedPosts()
                } label: {
                    
                    
                    HStack{
                        
                        VStack(alignment: .trailing, spacing: 0){
                            Text("manage posts")
                                .font(Font.system(size: 26, weight: .bold))
                                .multilineTextAlignment(.center)
                               // .foregroundStyle(Color.white)
                                
                                .frame(alignment: .top)
                            Text("Track all reported posts and you can delete posts or delete the all report for this post  ")
                                .font(Font.system(size: 18, weight: .light))
                                .multilineTextAlignment(.center)
                               // .foregroundStyle(Color.white)
                                .padding(.bottom)
                                .frame(alignment: .top)
                                .multilineTextAlignment(.trailing)
                                 
                        }
                        
                        
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70)
                            .padding(15)
                            .background(Color.gray.cornerRadius(15))
                            .foregroundColor(Color("dark1"))
                            
                        
                    }
                    .padding()
                    
                   
                }
                .foregroundColor(Color.black)

                
                
                NavigationLink {
                    AllReportedProductsView()
                    
                } label: {
                    
                    HStack{
                        
                        VStack(alignment: .trailing, spacing: 0){
                            Text("manage Product")
                                .font(Font.system(size: 26, weight: .bold))
                                .multilineTextAlignment(.center)
                               // .foregroundStyle(Color.white)
                                
                                .frame(alignment: .top)
                            Text("Track all reported Product and you can delete product  or delete the all report for this post  ")
                                .font(Font.system(size: 18, weight: .light))
                                .multilineTextAlignment(.center)
                               // .foregroundStyle(Color.white)
                                .padding(.bottom)
                                .frame(alignment: .top)
                                .multilineTextAlignment(.trailing)
                                 
                        }
                        
                        
                        Image(systemName: "cart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70)
                            .padding(15)
                            .background(Color.gray.cornerRadius(15))
                            .foregroundColor(Color("dark1"))
                            
                        
                    }
                    .padding()
                    
                }
                .foregroundColor(Color.black)
                
                
                
                
                NavigationLink {
                    AddFishView()
                } label: {
                    HStack{
                        
                        VStack(alignment: .trailing, spacing: 0){
                            Text("manage fishes ")
                                .font(Font.system(size: 26, weight: .bold))
                                .multilineTextAlignment(.center)
                               // .foregroundStyle(Color.white)
                                
                                .frame(alignment: .top)
                            Text("you can add fish, update fish inforrmation or dellete fish  ")
                                .font(Font.system(size: 18, weight: .light))
                                .multilineTextAlignment(.center)
                               // .foregroundStyle(Color.white)
                                .padding(.bottom)
                                .frame(alignment: .top)
                                .multilineTextAlignment(.trailing)
                                 
                        }
                        
                        
                        Image(systemName: "fish")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70)
                            .padding(15)
                            .background(Color.gray.cornerRadius(15))
                            .foregroundColor(Color("dark1"))
                            
                        
                    }
                    .padding()
                }
                .foregroundColor(Color.black)
             
            }
            .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height/2)
            .background(Color("SecondaryBlue"))
            
            
            Spacer()
            
        }
        //.background(Color("dark1"))
    }
}

struct AdminProfileView_Previews: PreviewProvider {
    static var previews: some View {
        AdminProfileView()
    }
}
