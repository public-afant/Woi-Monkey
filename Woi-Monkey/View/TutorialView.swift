//
//  TutorialScreen.swift
//  Woi-Monkey
//
//  Created by YH on 10/15/24.
//

import SwiftUI


struct TutorialView: View {
    
    @State  var path: [String] = []
    
    
    var body: some View {
        
        
        VStack{
            
            Text("Tutorial View")
            Text("Tutorial View")
            Text("Tutorial View")
            Text("Tutorial View")
            Text("Tutorial View")
            
            Spacer()
            
            
            //커스텀 컴포넌트 버튼
            ButtonView(title: "Next", backgroundColor: .primaryColor, size: 18, action: {path.append("MainView")})
            
            
        }.padding()
        
    }
    
}


#Preview {
    TutorialView()
}
