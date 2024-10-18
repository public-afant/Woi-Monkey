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
            
            ZStack{
                Color.primaryWhite.ignoresSafeArea()
                VStack{
                    Text("Main Page\n(Monkey time)").foregroundColor(.orange).font(.customFont32).multilineTextAlignment(.center)
                    Spacer()
                    
                    
                    
                    //커스텀 컴포넌트 버튼
                    ButtonView(title: "다 음", backgroundColor: .primaryColor, size: 18, action: {path.append("TodoView")})
                    
                }.navigationDestination(for: String.self){
                    value in
                    switch value{
                    case "TodoView":
                        TodoView(path: $path).navigationBarBackButtonHidden(true)
                    case "SetTimerView":
                        SetTimerView(path:$path).navigationBarBackButtonHidden(true)
                    case "TimerView":
                        TimerView(path:$path).navigationTitle("TimerView").navigationBarBackButtonHidden(true)
                    case "DashboardView":
                        DashboardView(path:$path).navigationTitle("DashboardView").navigationBarBackButtonHidden(true)
                    default:
                        Text("Error!")
                    }
                    
                }.padding()
            }
        }
    }
}

#Preview {
    MainView()
}
