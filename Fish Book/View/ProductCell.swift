//
//  ProductCell.swift
//  Fish Book
//
//  Created by mostafa on 18/03/2024.
//

import SwiftUI

struct ProductCell: View {
    var productt: ProductModel
   // @State private var isFavourite: Bool
    
   // init(productt: ProductModel) {
   //     self.productt = productt
   //     _isFavourite = State(initialValue: productt.isLiked)
   // }

    var body: some View {
        VStack {
            VStack {
                VStack{
                    Image(productt.imageUrl)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        
                }.frame(width: 155 , height: 154 , alignment: .center)
                    .background(Color.white.cornerRadius(12).shadow(color: Color("Primary Blue").opacity(0.2), radius: 3))
                
               // Spacer()
                
            }
           
                VStack(spacing: 0){
                    
                    Text(productt.title)
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(Color("b"))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding(.leading)
                   
                    Text( String(productt.content.prefix(26)) + "...")
                        .font(.system(size: 13,weight: .light,design: .serif))
                        .foregroundColor(Color("gray2"))
                        .frame( maxWidth: 150, alignment: .center)
                        
                    
                   
                    
                     Text("$ \(String(format: "%.1f", productt.price)) ") // Format the price here
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(Color("b"))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                            .padding(.top,5)
                }
           
                  
                    
                   
                
        }
        .frame(width: 155, height: 230)
        .padding(7)
        
    }
}
/*
 
 struct ProductCell_Previews: PreviewProvider {
     static var previews: some View {
         let product = ProductModel(id: 1, title: "cvvvv", content: "cfishing Tools 155155155155155", price: 10, imageUrl:  "fishingTools", isLiked:  true, categoryID: 3, publisherName: "name", publisherImagrURL: "x", publisherId: "3", crreatedOn: "s", upDatedOn: "s")
         return ProductCell(productt: product)
     }
 }
 
 */

