//
//  ProductDetailsView.swift
//  Fish Book
//
//  Created by mostafa on 11/04/2024.
//

import SwiftUI

struct ProductDetailsView: View {
   // var product  = dataa.allProducts.first
    @State private var isAnimated = false
    
   
    @State var product:ProductModel
    @State  var isFavourite:Bool
    
    init(isAnimated: Bool = false, product: ProductModel, isfavourite: Bool) {
        self.isAnimated = isAnimated
        self.product = product
        self._isFavourite = State(initialValue: product.liked)
    }
    
    var body: some View {
        VStack{
            Image(product.imageUrl ?? "")
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height/3.5,alignment: .center)
                .offset(x: 0 ,y: isAnimated ? 0 : 30)
                .onAppear{
                    withAnimation (.easeInOut(duration: 0.5)) {
                        isAnimated = true
                    }
                }
                .padding(.vertical,30)
            ScrollView(showsIndicators: false){
              
                    Text(product.title)
                        .font(.system(size: 35, weight: .semibold , design: .serif))
                        .frame(maxWidth: .infinity , alignment:  .leading)
                        .padding(.leading ,20)
                        .padding(.top ,20)
                HStack{
                    Text(product.updatedOn ?? product.createdOn)
                        .frame(alignment: .leading )
                    Spacer()
                }
                .padding(.leading,22)
                HStack{
                   Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40,height: 40)
                    
                    Text(product.publisherName)
                    Spacer()
                    
                }
                .padding(.leading)
                
                
                HStack{
                    Text("Description")
                        .font(.system(size: 30 ,weight: .bold,design: .serif))
                        .padding(21)
                    Spacer()
                    
                }
                Text(product.content)
                    .font(.system(size: 18,weight: .medium,design: .serif))
                    .padding(.leading,19)
                    .padding(.bottom)
                
                Spacer()
                HStack{
                    Text("$"+String(product.price))
                        .font(.system(size: 25, weight: .bold , design: .monospaced))
                        .frame(maxWidth: .infinity , alignment:  .leading)
                        .padding(.leading ,20)
                        .padding(.top,20)
                        .foregroundColor(Color.black)
                    Button {
                        let urlString  = isFavourite ? "http://localhost:8080/api/products/dislike/\(product.id)" : "http://localhost:8080/api/products/like/\(product.id)"
                        
                        let token  = UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
                        print("token"+token)
                        print("token"+urlString)
                        WebServices().sendID(httpMethod:"PUT",urlString: urlString, token: token) { (result: Result<Int, Error>) in
                            switch result {
                            case .success(let success):
                                isFavourite.toggle()
                                print (success)
                            case .failure(let error):
                                print(error.localizedDescription)
                            }
                        }
                        
                       
                    } label: {
                        Text(isFavourite ?  "remove from favourite" : "Add to favourite" )
                            .foregroundColor(Color.white)
                            .font(.system(size: 20,weight: .bold,design: .serif))
                            .frame(width: UIScreen.main.bounds.width/1.6, height: 50, alignment: .center)
                            .background(Color("Primary Blue"))
                            .cornerRadius(15)
                        
                        
                        
                    }
                    .padding(.top)
                    // .padding(.bottom ,50)
                    
                }
                
                
                
                
            }
                .padding(.horizontal ,5)
                .frame( height: UIScreen.main.bounds.height/2,alignment: .center)
                .background(Color("lightGray").cornerRadius(40.0).shadow(color: Color("Primary Blue").opacity(0.4), radius: 7))
                .edgesIgnoringSafeArea(.all )
                
               
                
            
        }
        .edgesIgnoringSafeArea(.bottom )
        
    }
}

 


      
        
    
/*
 struct ProductDetailsView_Previews: PreviewProvider {
     static var previews: some View {
         ProductDetailsView()
     }
 }

 
 */
