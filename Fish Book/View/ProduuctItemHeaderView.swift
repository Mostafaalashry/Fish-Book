//
//  ProduuctItemHeaderView.swift
//  Fish Book
//
//  Created by mostafa on 10/04/2024.
//

import SwiftUI

struct ProduuctItemHeaderView: View {
    let product : ProductModel
    var body: some View {
        HStack(spacing: 0){
            VStack(alignment: .leading , spacing: 0){
                Text(product.title)
                    .font(.system(size: 33,weight: .bold,design: .serif))
                    .foregroundColor(Color("Primary Blue"))
                    .padding(.leading)
                Text(product.content)
                    .font(.system(size: 16,weight: .light,design: .default))
                    .padding(.horizontal)
                    .padding(.top,5)

                Text("$ " + String(product.price))
                    .font(.system(size: 18,weight: .bold,design: .serif))
                    .padding(.leading)
                    .padding(.top,5)

            }
            
            Image(product.imageUrl)
                .resizable()
                .frame(width: 150 , height: 150 ,alignment: .center)
                .scaledToFit()
                .cornerRadius(12)

        }
        .padding(.vertical)
        .frame(width: UIScreen.main.bounds.width/1.1 ,alignment: .center)
        
       // .background(Color.white.cornerRadius(12).shadow(color: Color.blue,radius: 20))
        .background(Color.white.cornerRadius(12).shadow(color: Color("Primary Blue").opacity(0.4), radius: 10))
    }
}


/*
 struct ProduuctItemHeaderView_Previews: PreviewProvider {
     static var previews: some View {
         ProduuctItemHeaderView()
     }
 }
 */

