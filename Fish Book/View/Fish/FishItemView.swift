//
//  FishItemView.swift
//  Fish Book
//
//  Created by mostafa on 13/05/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct FishItemView: View {
    let fish : FishModel
    var body: some View {
        HStack(spacing: 0){
            VStack(alignment: .leading , spacing: 0){
                Text(fish.name)
                    .font(.system(size: 20,weight: .bold,design: .serif))
                    .foregroundColor(Color("Primary Blue"))
                    .padding(.leading)
                Text((fish.fishDetails.first?.content.prefix(100))!+"..." )  
                    .font(.system(size: 12,weight: .light,design: .default))
                    .foregroundColor(Color.black)
                    .padding(.horizontal)
                    .padding(.top,5)

            }
            
            WebImage(url: URL(string: fish.imageUrl!.replacingOccurrences(of: "http://", with: "https://") ?? ""))
           // Image(fish.imageUrl ?? "firstScreen")
                .resizable()
                .scaledToFit()
                .frame(width: 150 , height: 150 ,alignment: .center)
                .scaledToFit()
                .cornerRadius(7)
            

        }
        .padding(.vertical , 8)
        .padding(.trailing)
        .frame(width: UIScreen.main.bounds.width ,alignment: .center)
        
       // .background(Color.white.cornerRadius(12).shadow(color: Color("Primary Blue").opacity(0.4), radius: 10))
        
        .background(Color.white.cornerRadius(7))
    }
}
/*
 struct FishItemView_Previews: PreviewProvider {
     static var previews: some View {
         FishItemView()
     }
 }
 */

