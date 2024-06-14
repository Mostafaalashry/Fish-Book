//
//  FrriendAllPrroducts.swift
//  Fish Book
//
//  Created by mostafa on 10/06/2024.
//

import SwiftUI

struct FrriendAllPrroducts: View {
    let id : Int
    
    @EnvironmentObject var vm : FriendPrroductViewModel


    var body: some View {
       
            ScrollView{
               
       
                ForEach((vm.allProduct.reversed()) , id: \.id) { product in
                               
                    NavigationLink {
                        ProductDetailsView(product: product, isFavourite: product.liked)
                    } label: {
                        FriendPrroductItemView(product: product)
                    }

                     
                    }
                   
                Spacer()
                    .frame(height: 20)
                }
            .padding(.top)
        
            .onAppear {
                vm.fetchProducts(Userid: id)
            }
       
            
        
          
            
        
       
       
        //.padding(.bottom , 20)
       // .edgesIgnoringSafeArea(.vertical)
        
    }
}

