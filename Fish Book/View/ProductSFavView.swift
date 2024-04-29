//
//  ProductSFavView.swift
//  Fish Book
//
//  Created by mostafa on 16/04/2024.
//

import SwiftUI

struct ProductSFavView: View {
    @EnvironmentObject var vm : FavouriteProductsViewModel
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false  ){
                ForEach(vm.favouriteProductss ,  id: \.id) { product in
                    NavigationLink {
                    //    ProductDetailsView(product: product, isfavourite: product.liked)
                    } label: {
                        FavouriteProductItem(produuct: product)
                            .padding(.vertical,20)
                            .frame(width: UIScreen.main.bounds.width)
                    }
                    
                   
                }
                
                Spacer()
            }.frame(width: UIScreen.main.bounds.width)
                .navigationTitle("My Favourite Products")
                
            
            
        }
        .onAppear(
            perform: vm.fetchProducts
        )
    }
}
/*
 struct ProductSFavView_Previews: PreviewProvider {
     static var previews: some View {
         ProductSFavView()
     }
 }

 */
