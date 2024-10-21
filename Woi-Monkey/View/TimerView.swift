import SwiftUI

struct TimerView: View {
    
    @Binding var path: [String]
    @Binding var time: Double
    @State private var timer: Timer? = nil
    @State private var timeRemaining: Double
    
    init(path: Binding<[String]>, time: Binding<Double>) {
        self._path = path
        self._time = time
        self._timeRemaining = State(initialValue: time.wrappedValue * 60)
    }
    
    var body: some View {
        ZStack {
            Color.primaryWhite.ignoresSafeArea()
            VStack {
                VStack {
                    Text("준비해주세요!")
                        .font(.customFont26)
                    
                    Text("\(Int(time))분")
                        .font(.customFontBig)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text(formattedTime())
                        .font(.customFontBig)
                        .fontWeight(.bold)
                        .padding()
                    
                    ButtonView(title: "준비가 끝났어요", backgroundColor: .primaryColor, size: 18, action: {
                        path.append("DashboardView")
                    })
                }
                .padding(.horizontal, 30.0)
                .padding(.top, 40.0)
                .padding(.bottom, 30.0)
                .background(Color.primaryChampangne)
                .cornerRadius(15)
            }
            .padding(.horizontal, 20.0)
            .onAppear {
                startTimer()  // 뷰가 나타날 때 타이머 시작
            }
        }
    }
    
    private func formattedTime() -> String {
        let minutes = Int(timeRemaining) / 60
        let seconds = Int(timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func startTimer() {
        timeRemaining = time * 60  // 바인딩된 time을 초로 변환
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer?.invalidate() // 타이머 종료
                path.append("DashboardView")
            }
        }
    }
}

// PreviewWrapper: 바인딩된 값을 사용할 수 있는 래퍼
struct PreviewWrapper: View {
    @State private var path: [String] = []
    @State private var time: Double = 15.0 // 초기 시간

    var body: some View {
        TimerView(path: $path, time: $time) // 바인딩된 값 전달
    }
}

// Preview
#Preview {
    PreviewWrapper() // 래퍼 뷰를 사용하여 미리보기
}

