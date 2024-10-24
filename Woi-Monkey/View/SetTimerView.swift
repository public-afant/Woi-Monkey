import SwiftUI

extension Int {
    var doubleValue: Double {
        get { Double(self) }
        set { self = Int(newValue) }
    }
}

struct SetTimerView: View {
    @Binding var path: [String]
    @Binding var time: Double
    
    var body: some View {
        ZStack {
            Color.primaryWhite.ignoresSafeArea()
            VStack {
                VStack {
                    
                    Text("시간을 설정해주세요!")
                        .font(.customFont26)
                    
                    
                    Text("\(Int(time))분")
                        .font(.customFontBig)
                        .padding(20.0)
                    
                    HStack {
                        Text("-")
                            .font(.customFontBig)
                        
                        Slider(value: $time, in: 5...60, step: 5)
                            .accentColor(.primaryColor)
                            .cornerRadius(10)
                            .padding(10.0)
//                            .shadow(color: .clear, radius: 0) // 이 방식으로 추가적인 그림자를 제거
                        Text("+")
                            .font(.customFontBig)

                    }
                    
                    ButtonView(
                        title: "시 작",
                        backgroundColor: .primaryColor,
                        size: 22,
                        action: {path.append("TimerView")}
                    )
                }
                .padding(.horizontal, 30.0)
                .padding(.top, 40.0)
                .padding(.bottom, 30.0)
                .background(Color.primaryChampangne)
                .cornerRadius(15)
//                .shadow(radius: 10)
            }
            .padding(.horizontal, 20.0)
        }.navigationBarItems(leading: BackButton(path: $path))
    }
}

#Preview {
    SetTimerView(path: .constant([]), time: .constant(0.0))
}
