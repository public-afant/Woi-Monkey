//
//  MainScreen.swift
//  Woi-Monkey
//
//  Created by YH on 10/15/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MainView: View {
    
    @State var path: [String] = []
    @State var title: String = ""
    @State var time: Double = 10.0
    @State var isBlinking: Bool = false
    @Binding var showTutorial: Bool
    
    var body: some View {
        NavigationStack(path:$path){
            
            GeometryReader { geometry in
                ZStack{
                    AnimatedImage(name:"monkey_time_wide.gif")
                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .edgesIgnoringSafeArea(.all)

                    VStack{
                        
                        HStack(){
                            Spacer()
                            Image(systemName: "info.circle.fill").foregroundStyle(.primaryOrange).font(.system(size: 34)).onTapGesture {
                                showTutorial = true
                            }
                        }
                        .padding(.trailing, 10.0)
                        Spacer()
                        Text("Kick the Monkey!").font(.customFont36).padding(.bottom, 100.0)
                            .opacity(isBlinking ? 0.2 : 1)  // 투명도를 애니메이션으로 변경
                            .foregroundStyle(.primaryOrange)
                            .animation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true), value: isBlinking)
                            .onAppear {
                                isBlinking = true
                            }
                        Spacer()
                    }.navigationDestination(for: String.self){
                        value in
                        switch value{
                        case "TodoView":
                            TodoView(path: $path, title: $title).navigationBarBackButtonHidden(true)
                        case "SetTimerView":
                            SetTimerView(path: $path,time: $time).navigationBarBackButtonHidden(true)
                        case "TimerView":
                            TimerView(path:$path, time:$time).navigationBarBackButtonHidden(true)
                        case "DashboardView":
                            DashboardView(path: $path, title: $title).navigationBarBackButtonHidden(true)
                        default:
                            Text("Error!")
                        }
                        
                    }.padding()
                }.onTapGesture {
                    path.append("TodoView")
                }
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    MainView(showTutorial: .constant(false))
}
