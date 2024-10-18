//
//  Splash_Screen.swift
//  Woi-Monkey
//
//  Created by YH on 10/14/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SplashView: View {
    var body: some View {
        ZStack{
            Color.champangne.ignoresSafeArea()
            
            VStack{
                AnimatedImage(name:"monkey_ori.gif").frame(width: 300, height: 300)
                Text("Loading..").font(.customFont24)
                
                
            }
        }
    }
}

#Preview {
    SplashView()
}
