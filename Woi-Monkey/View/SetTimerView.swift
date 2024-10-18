import SwiftUI

extension Int {
    var doubleValue: Double {
        get { Double(self) }
        set { self = Int(newValue) }
    }
}

struct SetTimerView: View {
    @Binding var path: [String]
    @State private var duration:Int = 15
    
    var body: some View {
        ZStack {
            Color.primaryWhite.ignoresSafeArea()
            VStack {
                VStack {
                    Text("시간을 설정해주세요")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("\(duration) 분")
                        .font(.title).fontWeight(.bold)
                    
                    HStack {
                        Text("🙈")
                            .font(.system(size: 32))
                        
                        Slider(value: $duration.doubleValue, in: 5...60, step: 5)
                            .accentColor(.primaryColor)
                            .cornerRadius(10)
                            .padding(10.0)
                        Text("🙉")
                            .font(.system(size: 32))
                    }
                    
                    ButtonView(
                        title: "시작",
                        backgroundColor: .primaryColor,
                        size: 25,
                        action: {path.append("TimerView")}
                    )
                }
                .padding(.all, 40.0)
                .background(Color.primaryChampangne)
                .cornerRadius(15)
                .shadow(radius: 10)
            }
            .padding(.horizontal, 30.0)
        }
    }
}

#Preview {
    SetTimerView(path: .constant([]))
}
