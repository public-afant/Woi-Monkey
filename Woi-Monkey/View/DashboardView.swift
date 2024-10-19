//
//  DashboardScreen.swift
//  Woi-Monkey
//
//  Created by YH on 10/15/24.
//

import SwiftUI

struct DashboardView: View {
    @Binding var path: [String]
    @Binding var title: String
    
    @StateObject private var timerModel = TimerModel()
    
    var symbolSize:CGFloat = 60
    var symbolWeight:Font.Weight = .light
    
    
    
    var body: some View {
        ZStack{
            Color.primaryWhite.ignoresSafeArea()
            VStack{
                Spacer()
                Text("집중 시간").font(.customFont18)
                Text(timerModel.timeString).font(.customFontBig)
                Text(title).font(.customFont24).multilineTextAlignment(.center).padding()
                
                
                HStack{
                    
                    //                    Image(systemName: "play.circle").font(.system(size:symbolSize,weight: symbolWeight))
                    if(timerModel.isPaused){
                        Image(systemName: "arrow.clockwise.circle").font(.system(size: symbolSize,weight: symbolWeight)).onTapGesture {
                            timerModel.resumeTimer()
                        }
                        
                    }else {
                        Image(systemName: "pause.circle").font(.system(size: symbolSize,weight: symbolWeight)).onTapGesture {
                            timerModel.pauseTimer()
                        }
                    }
                    Image(systemName: "stop.circle").font(.system(size: symbolSize,weight: symbolWeight)).onTapGesture {
                        timerModel.stopTimer()
                        title=""
                        path.removeAll()
                    }
                    
                }.padding(.horizontal, 30.0)
                    .padding(.vertical, 20.0)
                
                Spacer()
                
            }.padding()
                .onAppear(){
                    timerModel.startTimer()
                }
        }
    }
}

#Preview {
    DashboardView(path: .constant([]), title: .constant("두 줄로 작성되면\n어떻게 나올까요?"))
    
}
