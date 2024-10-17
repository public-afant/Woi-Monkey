//
//  TimerScreen.swift
//  Woi-Monkey
//
//  Created by YH on 10/15/24.
//

import SwiftUI

struct TimerView: View {
    @Binding var path: [String]
    
    var body: some View {
        VStack{
            Text("Timer View!")
            Spacer()
            
            //커스텀 컴포넌트 버튼
            ButtonView(title: "DashBoard", backgroundColor: .primaryColor, size: 18, action: {path.append("DashboardView")})
            
         
        }.padding()
    }
}

#Preview {
    TimerView(path:.constant([]))
}
