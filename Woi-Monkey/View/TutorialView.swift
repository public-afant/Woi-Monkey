//
//  TutorialScreen.swift
//  Woi-Monkey
//
//  Created by YH on 10/15/24.
//

import SwiftUI


struct TutorialView: View {
    
    @State  var path: [String] = []
    var text = "우리의 뇌에는 때때로 즉각적인 만족을 추구하는 원숭이가 놀러옵니다."
    
    var body: some View {
        
        
        ZStack{
            Color.primaryWhite.ignoresSafeArea()
            VStack{
                Spacer()
                Image("monkeyPixel").resizable().frame(width: 320, height: 300)
                ZStack(alignment: .topLeading){
                    Image("text_box").resizable().frame(width: .infinity, height: 150)
                    VStack{
                        
                        Text(text.split(separator: "").joined(separator: "\u{200B}"))
                            .multilineTextAlignment(.leading).font(.customFont18).lineSpacing(8)
                    }.padding(40.0)
                }
                
                Spacer()
                //커스텀 컴포넌트 버튼
                ButtonView(title: "Next", backgroundColor: .primaryColor, size: 18, action: {path.append("MainView")})
                
                
            }.padding()
            
        }
    }
}


#Preview {
    TutorialView()
}
