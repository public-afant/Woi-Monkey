//
//  TutorialScreen.swift
//  Woi-Monkey
//
//  Created by YH on 10/15/24.
//

import SwiftUI
import SDWebImageSwiftUI


struct TutorialView: View {
    
    @State  var path: [String] = []
    @State var imageImage: [String] = ["head.gif"]
    @State var idx: Int = 0
    @Binding var showTutorial: Bool
    
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    
    var maxIdx: Int = 4
    var imageImage2: [String] = ["3","3","3","3","3"]
    var textArray: [String] = ["바쁜 일상 속 해야할 업무가 주어졌을 때, 우리의 뇌에는 때때로 즉각적인 만족을 추구하는 원숭이가 놀러옵니다.","이 원숭이는 당신의 머리 속 운전대를 빼앗아 당신을 어둠의 놀이동산으로 데려갑니다.","어둠의 놀이동산에서는 의미없는 행동들이 재미있게 느껴지며, 죄책감과 불안, 자기혐오로 가득 차있습니다.","그래서 우리는 이 원숭이의 존재를 자각하고, 어둠의 놀이동산에서 빠져나와야 합니다.","자, 이제 당신의 운전대를 잡을 시간입니다. 지금 함께 시작해봐요!"]
    
    func handleTutorialPage() {
        if(idx != maxIdx){
            idx = idx + 1
        }else{
            showTutorial = false
            isFirstLaunch = false
        }
    }
    
    var body: some View {
        
        
        ZStack{
            Color.primaryWhite.ignoresSafeArea()
            VStack{
                Spacer()
                AnimatedImage(name:"\(imageImage2[idx]).gif").frame(width: 200, height: 200)
                //                Image(imageImage2[idx]).resizable().frame(width: 350,height: 525)
                Spacer()
                ZStack(alignment: .center){
                    Image("text_box_2").resizable().frame(maxWidth: .infinity)
                        .frame(height: 175)
                    Text(textArray[idx].split(separator: "").joined(separator: "\u{200B}"))
                        .multilineTextAlignment(.leading).font(.customFont18).lineSpacing(8).padding(40.0).foregroundStyle(Color.black)
                }
                
                //커스텀 컴포넌트 버튼
                //                ButtonView(title: "Next", backgroundColor: .primaryColor, size: 18, action: {path.append("MainView")})
                
                
            }.padding()
            
        }.onTapGesture {
            handleTutorialPage()
        }
    }
}
// 240 350

#Preview {
    TutorialView(showTutorial: .constant(false))
}
