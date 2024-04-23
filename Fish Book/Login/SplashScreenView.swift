//
//  SplashScreenView.swift
//  Fish Book
//
//  Created by mostafa on 20/02/2024.
//

import SwiftUI
import Lottie

struct SplashScreenView: View {
    var body: some View {
        ZStack{
            Color("SecondaryBlue")
            VStack{
                Spacer()

                LottieView(animationFileName: "lottie-Animation-2 -", loopMode: .loop)
                    .frame(maxWidth: .infinity, maxHeight: 500, alignment: .center)
                    .padding(.bottom)
                Spacer()
                Spacer()

            }

        }
        .ignoresSafeArea()
       // .background(Color("SecondaryBlue"))
            
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
