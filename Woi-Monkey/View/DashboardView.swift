//
//  DashboardScreen.swift
//  Woi-Monkey
//
//  Created by YH on 10/15/24.
//

import SwiftUI

struct DashboardView: View {
    @Binding var path: [String]
    var body: some View {
        VStack{
            Text("Dashboard Viewww")
            Spacer()
            
            //커스텀 컴포넌트 버튼
            ButtonView(title: "Return Main", backgroundColor: .primaryColor, size: 18, action: {path.removeAll()})
        }.padding()
    }
}

#Preview {
    DashboardView(path:.constant([]))
}
