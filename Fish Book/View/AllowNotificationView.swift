//
//  AllowNotificationView.swift
//  Fish Book
//
//  Created by mostafa on 20/02/2024.
//

import SwiftUI

struct AllowNotificationView: View {
    var body: some View {
        VStack(){
            
            HStack( ){
                    VStack(alignment: .leading ){
                    Text("turn on notification")
                        .font(.system(size: 30,weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(
                            
                            LinearGradient(
                                colors: [.red, Color("Primary Blue")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .padding(.bottom)
                    Text("Get the most out of Company \n Staying up to \n data with what's happening ") .font(.system(size: 20,weight: .bold))
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(Color(hex: "#1a2a3c"))
                        .frame(alignment: .leading)
                    
                    
                    
                }  .frame(alignment: .leading)
            }.frame(maxWidth: .infinity , alignment: .leading)
                .padding(.leading)
                .padding()
            
            Button {
                //action
            } label: {
                Text("Allaw notification")
                    .font(.system(size: 23,weight: .semibold))
                    .foregroundColor(.white)
               
            }
            
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                . background(Color("Primary Blue"))
                
                .cornerRadius(12)
                .padding(.horizontal)
                
                .padding()
            
            HStack{
                Button{}
            label: {
                    Text("Akip for now")
            }.padding()
                    .padding(.leading)
                
                Spacer()
            }.padding(.leading)
            
               
        }
    }
}

struct AllowNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        AllowNotificationView()
    }
}
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        let rgbValue = UInt32(hex, radix: 16)
        let r = Double((rgbValue! & 0xFF0000) >> 16) / 255
        let g = Double((rgbValue! & 0x00FF00) >> 8) / 255
        let b = Double(rgbValue! & 0x0000FF) / 255
        self.init(red: r, green: g, blue: b)
    }
}
