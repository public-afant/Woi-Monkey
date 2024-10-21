//
//  Splash_Screen.swift
//  Woi-Monkey
//
//  Created by YH on 10/14/24.
//

import SwiftUI
import SDWebImageSwiftUI

private func requestNotificationPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        if let error = error {
            print("Error requesting notification permissions: \(error)")
        } else {
            print("Notification permission granted: \(granted)")
        }
    }
}

struct SplashView: View {
    var body: some View {
        ZStack{
            Color.champangne.ignoresSafeArea()
            
            VStack{
                AnimatedImage(name:"monkey_ori.gif").frame(width: 300, height: 300)
                Text("Loading..").font(.customFont24)
            }
            
        }.onAppear {
            requestNotificationPermission()
        }
    }
}

#Preview {
    SplashView()
}
