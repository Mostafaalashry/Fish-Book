//
//  FavouriteProductItem.swift
//  Fish Book
//
//  Created by mostafa on 16/04/2024.
//

import SwiftUI

struct FavouriteProductItem: View {
   
        @EnvironmentObject var vm :FavouriteProductsViewModel
        let produuct  : ProductModel
        var body: some View {
            HStack(spacing: 0){
                Image(produuct.imageUrl)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150 ,height: 150 ,alignment: .center)
                VStack{
                    Text(produuct.title)
                        .font(.system(size: 30 ,weight: .semibold ,design: .serif))
                        .padding(.bottom,5)
                    
                    HStack{
                        Text("$ "+String(produuct.price))
                            .font(.system(size:25 ,weight: .bold ,design: .serif))
                            .foregroundColor(Color.blue)
                        
                        Button {
                            
                            vm.deleteFromFavourite(product: produuct)
                            
                        } label: {
                           Image(systemName: "trash.circle.fill")
                                .font(.system(size: 30 ,weight: .semibold ,design: .serif))
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
