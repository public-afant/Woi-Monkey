//
//  TimerScreen.swift
//  Woi-Monkey
//
//  Created by YH on 10/15/24.
//

import UIKit
import SwiftUI
import Foundation
import SDWebImageSwiftUI


struct Timer {
    var duration: Int
}

struct SetTimerView: View {
    @Binding var path: [String]
    @State private var Time = Timer(duration: 15)   // default

    var body: some View {
        VStack{

            Text("시간을 설정해주세요")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("\(Time.duration) 분")
                .font(.largeTitle)
                .padding()
            
            HStack {
                Text("🙈")
                    .font(.system(size: 32))
                    
                // 슬라이더: 최소5분, 최대60분, 보폭5분
                Slider(value: $Time.duration.double, in: 5...60, step: 5)
                    .accentColor(.green) // 슬라이더의 색상
                    .background(Color.gray.opacity(0.2)) // 배경색
                    .cornerRadius(10) // 모서리 둥글게
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5) // 그림자 효과
                    .padding(10.0)
                
                Text("🙉")
                    .font(.system(size: 32))
            }
            
            //커스텀 컴포넌트 버튼
            ButtonView(title: "시작",
                       backgroundColor: .primaryColor,
                       size: 25,
                       action: {path.append("TimerView")}
            )
        }.padding()
        .background(Color.white) // 전체 배경색
        .cornerRadius(15) // 전체 모서리 둥글게
        .shadow(radius: 10) // 전체 그림자
        .padding()
    }
}

#Preview {
    SetTimerView(path: .constant([]))
}
