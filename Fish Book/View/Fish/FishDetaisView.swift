//
//  FishDetaisView.swift
//  Fish Book
//
//  Created by mostafa on 13/05/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct FishDetaisView: View {
    @State private var isAnimated = false
    let fish:FishModel
    var body: some View {
        ScrollView(showsIndicators: false){
       
            WebImage(url: URL(string: fish.imageUrl!.replacingOccurrences(of: "http://", with: "https://") ?? ""))
           // Image((fish.imageUrl)!)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3.5,alignment: .center)
                .offset(x: 0 ,y: isAnimated ? 0 : 30)
                .onAppear{
                    withAnimation (.easeInOut(duration: 0.5)) {
                        isAnimated = true
                    }
                }
                .padding(.bottom,30)
            VStack{
              
               
                HStack{
                    Spacer()
                    Text(fish.name)
                        .font(.system(size: 20, weight: .semibold , design: .serif))
                        .frame(maxWidth: .infinity , alignment:.trailing)
                        .padding(20)
                }
                ForEach(fish.fishDetails  , id: \.header) { fishDetails in
                    VStack{
                        HStack{
                            Spacer()
                            Text(fishDetails.header)
                                .font(.system(size: 22, weight: .semibold , design: .serif))
                                .frame(maxWidth: .infinity , alignment:.trailing)
                                .padding(.leading ,20)
                                .padding(.top ,5)
                        }
                        HStack{
                            
                            Text(fishDetails.content)
                                .font(.system(size: 15, weight: .semibold , design: .serif))
                                .frame(maxWidth: .infinity , alignment:.trailing)
                                .padding(.leading ,20)
                                .padding(.top ,5)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding(.bottom ,25)
                   
                }
                .padding(.trailing)
               
              
            Spacer()
                    .frame(height: 50)
                
                
            }
                .padding(.horizontal ,5)
               // .frame( height: UIScreen.main.bounds.height/2,alignment: .center)
                .background(Color("lightGray").cornerRadius(40.0).shadow(color: Color("Primary Blue").opacity(0.4), radius: 7))
                
                .edgesIgnoringSafeArea(.all )
                
               
                
            
        }
        .edgesIgnoringSafeArea(.bottom )
    }
}
/*
 struct FishDetaisView_Previews: PreviewProvider {
     static var previews: some View {
         FishDetaisView()
     }
 }
 */

