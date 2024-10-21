//
//  DashboardScreen.swift
//  Woi-Monkey
//
//  Created by YH on 10/15/24.
//

import SwiftUI
import ActivityKit

struct DashboardView: View {
    @Binding var path: [String]
    
    @Binding var title: String
    
    @State private var activity: Activity<DynamicIslandWidgetAttributes>? = nil
    
    @State private var timeDate: Date? = nil
    
    var symbolSize:CGFloat = 60
    
    var symbolWeight:Font.Weight = .light
    
    
    func runTimer(){
        timeDate = .now
        
        let attributes = DynamicIslandWidgetAttributes(name: "워이몽키")
        let state = DynamicIslandWidgetAttributes.ContentState(time: timeDate, title: title)
        
        activity = try? Activity<DynamicIslandWidgetAttributes>.request(attributes: attributes, content: ActivityContent(state: state, staleDate: nil))
        
        
    }
    
    func stopTimer(){
        guard let timeDate else { return }

        let state = DynamicIslandWidgetAttributes.ContentState(time: timeDate, title: title)
        let finalContent = ActivityContent(state: state, staleDate: nil)
        
        Task {
            await activity?.end(finalContent, dismissalPolicy: .immediate)
        }
        
        self.timeDate = nil
        self.title = ""
    }
    
        
    
    
    var body: some View {
        ZStack{
            Color.primaryWhite.ignoresSafeArea()
            VStack{
                Spacer()
                Text("집중 시간").font(.customFont18)
                if let time = timeDate {
                    Text(time, style: .timer).font(.customFontBig)
                }else {
                    Text("0:00").font(.customFontBig)
                }
                
                
                Text(title).font(.customFont24).multilineTextAlignment(.center).padding()
                
                
                HStack{
                    
//                    if(timerModel.isPaused){
//                        Image(systemName: "arrow.clockwise.circle").font(.system(size: symbolSize,weight: symbolWeight)).onTapGesture {
//                            timerModel.resumeTimer()
//                        }
//                        
//                    }else {
//                        Image(systemName: "pause.circle").font(.system(size: symbolSize,weight: symbolWeight)).onTapGesture {
//                            timerModel.pauseTimer()
//                        }
//                    }
                    Image(systemName: "stop.circle").font(.system(size: symbolSize,weight: symbolWeight)).onTapGesture {
                        stopTimer()
                        path.removeAll()
                    }
                    
                }.padding(.horizontal, 30.0)
                    .padding(.vertical, 20.0)
                
                Spacer()
                
            }.padding()
                .onAppear(){
//                    runTimer()
                    if #available(iOS 16.2, *) {
                        runTimer()
                    }
                }
        }
    }
}

#Preview {
    DashboardView(path: .constant([]), title: .constant("두 줄로 작성되면\n어떻게 나올까요?"))
    
}
