//
//  TodoScreen.swift
//  Woi-Monkey
//
//  Created by YH on 10/15/24.
//

import SwiftUI

struct TodoView: View {
    
    @Binding var path: [String]
    
    var body: some View {
        VStack{
            Text("TodoViiiiew!")
            Spacer()
            
            //커스텀 컴포넌트 버튼
            ButtonView(title: "Set Timer", backgroundColor: .primaryColor, size: 18, action: {path.append("SetTimerView")})
            
            
        }.padding()
    }
}

#Preview {
    TodoView(path: .constant([]))
}
