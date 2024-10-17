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
        VStack{
            AnimatedImage(name:"monkey.gif").resizable().frame(width: 700, height: 400)
            Text("Loaaaaaddddding.....").bold()
            

        }
    }
}

#Preview {
    SplashView()
}
