//
//  SetTimerScreen.swift
//  Woi-Monkey
//
//  Created by YH on 10/15/24.
//

import SwiftUI

struct SetTimerView: View {
    @Binding var path: [String]
    var body: some View {
        VStack{
            Text("Set Timer Viewwww!!")
            Spacer()
            
            //커스텀 컴포넌트 버튼
            ButtonView(title: "Let's Go", backgroundColor: .primaryColor, size: 18, action: {path.append("TimerView")})
            
        }.padding()
    }
}

#Preview {
    SetTimerView(path: .constant([]))
}
