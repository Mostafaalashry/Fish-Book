//
//  ProductDetailsView.swift
//  Fish Book
//
//  Created by mostafa on 11/04/2024.
//

import SwiftUI
import SDWebImageSwiftUI
struct ProductDetailsView: View {
   // var product  = dataa.allProducts.first
    @State private var isAnimated = false
    @State private var showAlert = false
    
    @EnvironmentObject var vm :AllProductViewModel
    @State var product:ProductModel
    @State  var isFavourite:Bool
  
    init(isAnimated: Bool = false, product: ProductModel, isFavourite: Bool) {
        self._isAnimated = State(initialValue: isAnimated)
       
        self.product = product
        self._isFavourite = State(initialValue: isFavourite)
    }
    
    var body: some View {
        VStack{
           // Image(product.imageUrl ?? "")
           // WebImage(url: URL(string: product.imageUrl ?? ""))
            WebImage(url: URL(string: product.imageUrl!.replacingOccurrences(of: "http://", with: "https://") ?? ""))

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
                HStack{
                    Text(product.title)
                        .font(.system(size: 20, weight: .semibold , design: .serif))
                        .frame(maxWidth: .infinity , alignment:  .leading)
                        .padding(.leading ,20)
                        .padding(.top ,20)
                    
                    Spacer()
                    
                    Button {
                        showAlert = true
                    } label: {
                        Image(systemName: "bookmark.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 10,height: 10)
                            .foregroundColor(Color("gray"))
                    }
                    .frame(alignment: .trailing)
                    .padding(.trailing , 20)
                    .padding(.top , 22)

                    
                    
                    
                    
                    
                }
                   
                HStack{
                    Text(product.updatedOn?.prefix(10) ?? product.createdOn.prefix(10))
                        .frame(alignment: .leading )
                    Spacer()
                }
                .padding(.leading,22)
                HStack{
                    
                    if product.imageUrl == nil || product.imageUrl==""{
                        Image(systemName: "person.crop.circle.fill")
                             .resizable()
                             .scaledToFill()
                             .frame(width: 40,height: 40)
                             .foregroundColor(Color("gray"))
                    }
                    else{
                        
                        WebImage(url: URL(string: product.imageUrl!.replacingOccurrences(of: "http://", with: "https://") ?? ""))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40,height: 40)
                            .foregroundColor(Color("gray"))
                            .clipShape(Circle())
                    }
                    
                  
                    
                    Text(product.publisherName)
                    Spacer()
                    
                }
                .padding(.leading)
                
                
                HStack{
                    Text("Description")
                        .font(.system(size: 25 ,weight: .bold,design: .serif))
                        .padding(21)
                    Spacer()
                    
                }
                HStack{
                    Text(product.content)
                        .font(.system(size: 15,weight: .medium,design: .serif))
                        .padding(.leading,19)
                        .padding(.bottom)
                        .frame(alignment: .leading)
                    Spacer()
                }
            
                
                Spacer()
                HStack{
                    Text("$"+String(product.price))
                        .font(.system(size: 15, weight: .bold , design: .monospaced))
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
                            .font(.system(size: 18,weight: .bold,design: .serif))
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
        
        .alert(isPresented: $showAlert) {
                  Alert(
                      title: Text("Report"),
                      message: Text("Are you sure do you want to send a report."),
                      primaryButton: .default(Text("OK")) {
                         
                          
                          vm.report(id: Int(product.id))
                        
                      },
                      secondaryButton: .cancel(Text("Cancel")) {
                         
                      }
                  )
              }
        }
        
        
    
}

 


      
        
    
/*
 .alert("Are you sure do you want to send a report ", isPresented: $showAlert) {
     
     Button("OK", role: .cancel) {
         WebServices().sendID(httpMethod:"PUT",urlString: "http://localhost:8080/api/products/repoort/\(product.id)", token: UserDefaults.standard.string(forKey: "jsonwebtoken")!) { (result: Result<Int, Error>) in
             switch result {
             case .success(let success):
               
                 print (success)
             case .failure(let error):
                 print(error.localizedDescription)
             }
         }
     }
     Button("cancel", role: .cancel) {
         
         }
     }
 
 
 struct ProductDetailsView_Previews: PreviewProvider {
     static var previews: some View {
         ProductDetailsView()
     }
 }

 
 */
