//
//  Splash_Screen.swift
//  Woi-Monkey
//
//  Created by YH on 10/14/24.
//

import SwiftUI

struct Splash_Screen: View {
    var body: some View {
        VStack{
            Image("temp_logo2").resizable().frame(width: 220, height: 220).scaledToFit()
            Text("Loaaaaaddddding..").bold()
        }
    }
}

#Preview {
    Splash_Screen()
}
