//
//  LottieView.swift
//  Fish Book
//
//  Created by mostafa on 19/02/2024.
//

import SwiftUI
import Lottie


struct LottieView: UIViewRepresentable {
    
    var animationFileName: String
    let loopMode: LottieLoopMode
    
    init(animationFileName: String, loopMode: LottieLoopMode) {
        self.animationFileName = animationFileName
        self.loopMode = loopMode
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: animationFileName)
        animationView.loopMode = loopMode
        animationView.play()
        animationView.contentMode = .scaleAspectFill
        return animationView
    }
}
