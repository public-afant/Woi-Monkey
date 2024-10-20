

import SwiftUI

import ActivityKit

class TimerModel: ObservableObject {
    
   
    
    @Published var timeString = "00:00:00"
    private var secondsElapsed = 0
    private var timer: Timer?
    @Published var isPaused = false // 일시정지 상태를 추적하는 변수
    
//    @State private var activity: Activity<DynamicIslandWidgetAttributes>? = nil

    
    // 타이머 시작
    func startTimer() {
        timer?.invalidate()  // 기존 타이머가 있으면 중지
        secondsElapsed = 0   // 초기화
        timeString = formatTime(secondsElapsed)  // 초기 시간 설정
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.secondsElapsed += 1
            self.timeString = self.formatTime(self.secondsElapsed)
            
            
//            if let activity = activity {
//                let updatedContentState = DynamicIslandWidgetAttributes.ContentState(time: timeString)
//                Task {
//                    await activity.update(ActivityContent(state: updatedContentState, staleDate: nil))
//                }
//            }
            
            
        }
    }
    
    // 타이머 중지
    func stopTimer() {
        timer?.invalidate()
    }
    
    // 타이머 일시정지
    func pauseTimer() {
        timer?.invalidate()  // 현재 타이머를 중지
        isPaused = true
    }
    
    // 타이머 재시작
    func resumeTimer() {
        guard isPaused else { return } // 일시정지 상태가 아니면 재시작하지 않음
        isPaused = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.secondsElapsed += 1
            self.timeString = self.formatTime(self.secondsElapsed)
        }
    }
    // 초를 시/분/초 형식으로 포맷팅하는 함수
    private func formatTime(_ totalSeconds: Int) -> String {
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
