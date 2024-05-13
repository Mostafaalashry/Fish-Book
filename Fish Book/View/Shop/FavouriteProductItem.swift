//
//  FavouriteProductItem.swift
//  Fish Book
//
//  Created by mostafa on 16/04/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavouriteProductItem: View {
   
        @EnvironmentObject var vm :FavouriteProductsViewModel
        let produuct  : ProductFavouriteModel
        var body: some View {
            HStack(spacing: 0){
               // Image(produuct.imageUrl ?? "")
                VStack{
                    WebImage(url: URL(string: produuct.imageUrl!.replacingOccurrences(of: "http://", with: "https://") ?? ""))
                    
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        .frame(width: 150 ,height: 150 ,alignment: .center)
                }
                .frame(width: 150 , height: 150 , alignment: .leading)
                    .background(Color.white.cornerRadius(12).shadow(color: Color("Primary Blue").opacity(0.2), radius: 3))
                    .padding(.trailing)
                VStack{
                    Text(produuct.title)
                        .font(.system(size: 20 ,weight: .semibold ,design: .serif))
                        .padding(.bottom,5)
                    
                    HStack{
                        Text("$ "+String(produuct.price))
                            .font(.system(size:17 ,weight: .bold ,design: .serif))
                            .foregroundColor(Color.blue)
                        
                        Button {
                            
                            vm.deleteFromFavourite(product: produuct)
                            
                        } label: {
                           Image(systemName: "trash.circle.fill")
                                .font(.system(size: 27 ,weight: .semibold ,design: .serif))
                                .foregroundColor(Color.black)
                        }
                        .padding(.leading)
                       

                    }
                }
            }
          
            .frame(width: UIScreen.main.bounds.width/1.1 , height: 150 ,alignment: .center)
            .background(Color.white.cornerRadius(12).shadow(color: Color("Primary Blue").opacity(0.6), radius: 15))

        }
    }

/*
 
 struct FavouriteProductItem_Previews: PreviewProvider {
     static var previews: some View {
         FavouriteProductItem(, produuct: <#ProductModel#>)
     }
 }

 
 */
