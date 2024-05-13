//
//  ShopView.swift
//  Fish Book
//
//  Created by mostafa on 18/03/2024.
//

import SwiftUI

struct ShopView: View {
   
    @State var indexer:Int = 0

    @State var timer  = Timer.TimerPublisher(interval: 2, runLoop: .main, mode: .common).autoconnect()
    @State private var showingPopover :Bool = false
    
    @EnvironmentObject var vm : AllProductViewModel
    
    @State var IsFilterApplied = false
   
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    
                    HStack{
                        
                        Text("Fishing shop")
                        
                            .font(.system(size: 28,weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(
                                
                                LinearGradient(
                                    colors: [.red, Color("Primary Blue")],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .padding(.leading ,30)
                        Spacer()
                        
                        
                        
                      
                        
                        
                    }
                    
                    Spacer()
                    ScrollView(showsIndicators: false) {
                        if vm.allProducts.count != 0{
                            headerView
                        }
                        fishingGear
                        
                        baitfishing
                        Spacer()
                    }
                    .overlay(
                       
                        CustomButtonFilter
                    
                        ,alignment: .bottomTrailing
                    )
                    
                    .edgesIgnoringSafeArea(.all)
                        .ignoresSafeArea(.all)
                    
                    
                    
                }
            }
            
        }
        .onAppear(
            perform: vm.fetchProducts
        )
    }
}
/*
struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(selected:  )
    }
}
*/
/*
 let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
 
 LazyVGrid(columns: columns, spacing: 20) {
                 ForEach(0..<20) { index in
                     ProductCell(productt: product)
                 }
             }
             .padding()
 
 
 
 
 
 
 
 extension ShopView {
     var headerView: some View {
         
             TabView(selection: $indexer) {
                 ForEach(0..<vm.allProducts.count) { index in
                     ProduuctItemHeaderView(product: vm.allProducts[index])
                         .tag(index)
                 }
             }
             .tabViewStyle(PageTabViewStyle())
             .frame(height: UIScreen.main.bounds.height/2.7 , alignment: .center)
             .onReceive(timer) { timerCount in
                 withAnimation(.easeInOut(duration: 1.0)) {
                     indexer = indexer == 4 ? 0 : indexer + 1
                 }
             }
         
     }
 }
 
 
 
 extension ShopView {
     var headerView: some View {
        
             TabView(selection: $indexer) {
                   ForEach(0..<vm.allProducts.count ) { index in
                 ProduuctItemHeaderView(product: vm.allProducts[indexer])
                     .tag(index)
                
                 
                 
                   }
             }
             .tabViewStyle(PageTabViewStyle())
             .frame(height: UIScreen.main.bounds.height/2.7 , alignment: .center)
             .onReceive(timer) { _ in
                 withAnimation(.easeInOut(duration: 1.0)) {
                     indexer = indexer==vm.allProducts.count-1 ? 0 : indexer+1
                     
                     
                 }
             }
         }
        
     
 }
 */



extension ShopView {
    var headerView: some View {
        TabView(selection: $indexer) {
            ForEach(0..<vm.allProducts.count) { index in
                ProduuctItemHeaderView(product: vm.allProducts[indexer])
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: UIScreen.main.bounds.height/2.7, alignment: .center)
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 1.0)) {
                indexer = indexer == vm.allProducts.count - 1 ? 0 : indexer + 1
            }
        }
    }
}

/*
 
 
extension ShopView{
    var headerView :some View{
        if vm.allProducts.count >= 5{
            TabView(selection: $indexer) {
                
                
                ProduuctItemHeaderView( product: vm.allProducts[indexer])
                    .tag(0)
                
                
                ProduuctItemHeaderView( product: vm.allProducts[indexer])
                    .tag(1)
                
                
                ProduuctItemHeaderView( product: vm.allProducts[indexer])
                    .tag(2)
                
                
                ProduuctItemHeaderView( product: vm.allProducts[indexer])
                    .tag(3)
                
                
                ProduuctItemHeaderView( product: vm.allProducts[indexer])
                    .tag(4)
                
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: UIScreen.main.bounds.height/2.7 , alignment: .center)
            .onReceive(timer) { timerCount in
                withAnimation(.easeInOut(duration: 1.0)) {
                    indexer  = indexer==5 ? 0 : indexer+1
                }
            }
        }
        else {
                    return AnyView(VStack {})
            }
        
    }
}
*/

extension ShopView{
    var fishingGear :some View{
        VStack{
            Text("fishing gear")
                .font(.system(size: 18, weight: .bold , design: .serif))
                .frame(maxWidth: .infinity , alignment:  .leading)
                .padding(.leading)
            
            ScrollView(.horizontal){
                
                HStack{
                    
                    
                    ForEach(vm.allProducts , id: \.id) { productt in
                        if productt.categoryId == 1 {
                            
                            NavigationLink {
                                ProductDetailsView( product: productt, isFavourite: productt.liked)
                            } label: {
                                ProductCell(productt: productt)
                                  //  .padding()
                            }

                            
                        }
                        
                    }
                    
                }
            }
          

        }
    }
}


extension ShopView{
    var baitfishing :some View{
        VStack{
            Text("bait fish")
                .font(.system(size: 18, weight: .bold , design: .serif))
                .frame(maxWidth: .infinity , alignment:  .leading)
                .padding(.leading)
            
            ScrollView(.horizontal ,showsIndicators: false){
                
                HStack{
                    
                    
                    ForEach(vm.allProducts , id: \.id) { productt in
                        if productt.categoryId == 2 {
                            
                            NavigationLink {
                                ProductDetailsView( product: productt, isFavourite: productt.liked)
                            } label: {
                                ProductCell(productt: productt)
                                  //  .padding()
                            }

                            
                        }
                        
                    }
                    
                }
            }
          

        }
    }
}

/*
 .overlay(
    
     CustomButtonFilter
 
     ,alignment: .bottomTrailing)
 */
extension ShopView{
    var CustomButtonFilter : some View {
        VStack {
         
              
            
             NavigationLink {
              ProductSFavView()
                 
                 
             } label: {
                 Image(systemName: "heart.fill")
                     .resizable()
                     .scaledToFill()
                     .frame(width: 15, height: 15, alignment: .center)
                     .padding(20)
                     .background(Color(.blue))
                     .cornerRadius(50)
                     .shadow(color: .black, radius:10, x: 0, y: 0)
                     .padding(.trailing)
                     .opacity(IsFilterApplied ? 1 : 0 )
                     
             }
             .disabled(!IsFilterApplied)
             
             
             
            
              
              Button {
                  showingPopover.toggle()
              } label: {
                  Image(systemName: "plus")
                      .resizable()
                      .scaledToFill()
                      .frame(width: 15, height: 15, alignment: .center)
                      .padding(20)
                      .background(Color("Primary Blue"))
                      .cornerRadius(50)
                      .shadow(color: .black, radius:10, x: 0, y: 0)
                      .padding(.trailing)
                      
                      .opacity(IsFilterApplied ? 1 : 0 )
                      
              }
              .disabled(!IsFilterApplied)
              .popover(isPresented: $showingPopover) {
                  if showingPopover{
                      AddProductView(showingPopover: $showingPopover)
                  }
                  
                  
              }
            
        
          Image(systemName: "line.3.horizontal.decrease" )
             .resizable()
             .scaledToFill()
             .frame(width: 15, height: 15, alignment: .center)
             .padding(20)
             .background(Color("Primary Blue"))
             .cornerRadius(50)
             .shadow(color: .black, radius:10, x: 0, y: 0)
             .rotationEffect(Angle(degrees: IsFilterApplied ? 0 : 180))
             .padding(.trailing)
             .padding(.bottom)
             .onTapGesture {
              withAnimation(.easeInOut(duration: 0.6)) {
        
               IsFilterApplied.toggle()
              }
     
         }
          
             
           /*
            Image(systemName:  "line.3.horizontal.decrease" )
                .resizable()
                .scaledToFill()
                .frame(width: 15, height: 15, alignment: .center)
                .padding(20)
                .background(Color("Primary Blue"))
                .cornerRadius(50)
                .shadow(color: .black, radius:30, x: 0, y: 0)
                .rotationEffect(Angle(degrees: IsFilterApplied ? 0 : 180))
                .padding(.trailing)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        
                        IsFilterApplied.toggle()
                    }
                   
                }
               */
       
            
        } .foregroundColor(.white)
    }
}
