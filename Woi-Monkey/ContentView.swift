//
//  ContentView.swift
//  Woi-Monkey
//
//  Created by YH on 10/14/24.
//

import SwiftUI

struct ContentView: View {
    
    // 프로그램이 실행되는 시점에 isLaunching 값을 True로 초기화
    @State  var isLaunching:Bool = false
    
    
    var body: some View {
        
        // isLaunching이 True 값이면 스플레시화면 송출
        if isLaunching {
            SplashScreen().onAppear().opacity(isLaunching ? 1 : 0)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation(.easeIn(duration: 1)) {
                            // 1초가 지난 후 isLaunching 값을 false로 변경
                            isLaunching = false
                        }
                    }
                }
        } else {
            VStack{
                Image("temp_logo").resizable().frame(width: 220,height: 220).scaledToFit()
                Text("## Commit Test").font(.system(size: 30))
            }
        }
    }
    
}



#Preview {
    ContentView()
}
