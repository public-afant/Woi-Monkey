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
    @State var time: Double = 15.0
    @State var isBlinking: Bool = false
    
    var body: some View {
        NavigationStack(path:$path){
            
            GeometryReader { geometry in
                ZStack{
                    Color.primaryChampangne.ignoresSafeArea()
                    VStack{
                        Spacer()
                        
                        AnimatedImage(name:"monkey_ori.gif").frame(width: 300, height: 300)
                        Text("Touch to Start").font(.customFont36).padding()
                            .opacity(isBlinking ? 0.2 : 1)  // 투명도를 애니메이션으로 변경
                            .foregroundStyle(.primaryOrange)
                            .animation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true), value: isBlinking)
                            .onAppear {
                                isBlinking = true
                            }
                            .onAppear {
                                NotificationManager.shared.requestNotificationPermission()
                                NotificationManager.shared.scheduleMultipleNotifications()
                            }
                        
                        
                        Spacer()
                        
                        
                        Image("monkeyPixel") // 이미지 파일 이름을 입력
                            .resizable() // 이미지 크기를 조정할 수 있게 함
                            .scaledToFill() // 이미지를 화면에 꽉 채우기 위해 사용
                            .frame(maxWidth: geometry.size.width)
                            .frame(height: geometry.size.height*0.22) // 화면 하단 30%를 이미지로 채움
//                            .clipped() // 이미지가 넘치는 부분을 잘라냄
                        
                        
                        
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
                        case "NotificationView":
                            NotificationView(path: $path, title:
                            $title).navigationBarBackButtonHidden(true)
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
    MainView()
}
