//
//  MainScreen.swift
//  Woi-Monkey
//
//  Created by YH on 10/15/24.
//

import SwiftUI

struct MainView: View {
    
    @State  var path: [String] = []
    
    var body: some View {
        NavigationStack(path:$path){
            VStack{
                Text("Main Page(Monkey time)")
                Spacer()
                
                //커스텀 컴포넌트 버튼
                ButtonView(title: "Next", backgroundColor: .primaryColor, size: 18, action: {path.append("TodoView")})
                
            }.navigationDestination(for: String.self){
                value in
                switch value{
                case "TodoView":
                    TodoView(path: $path).navigationTitle("TodoView").navigationBarBackButtonHidden(true)
                case "SetTimerView":
                    SetTimerView(path:$path).navigationTitle("SetTimerView").navigationBarBackButtonHidden(true)
                case "TimerView":
                    TimerView(path:$path).navigationTitle("TimerView").navigationBarBackButtonHidden(true)
                case "DashboardView":
                    DashboardView(path:$path).navigationTitle("DashboardView").navigationBarBackButtonHidden(true)
                default:
                    Text("Error!")
                }
                
            }.navigationTitle("MainView").padding()
        }
    }
}

#Preview {
    MainView()
}
