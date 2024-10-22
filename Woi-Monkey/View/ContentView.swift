//
//  ContentView.swift
//  Woi-Monkey
//
//  Created by YH on 10/14/24.
//

import SwiftUI

struct ContentView: View {
    
    // 프로그램이 실행되는 시점에 isLaunching 값을 True로 초기화
    @State  var isLaunching:Bool = true
    
    @State private var showTutorial: Bool = false // 튜토리얼 표시 여부
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true // 첫 실행 여부 저장
    
    
    
    var body: some View {
        
        if isLaunching {
            SplashView().onAppear().opacity(isLaunching ? 1 : 0)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.easeIn(duration: 1)) {
                            // 2초가 지난 후 isLaunching 값을 false로 변경
                            isLaunching = false
                        }
                    }
                }
        } else {
            
            ZStack{
                MainView(showTutorial: $showTutorial)
                if showTutorial {
                    TutorialView(showTutorial: $showTutorial)
                }
            }.onAppear(){
            
                if isFirstLaunch {
                    showTutorial = true
//                    isFirstLaunch = false
                }
            }
        }
    }
    
}



#Preview {
    ContentView()
}
