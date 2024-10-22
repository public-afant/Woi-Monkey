import SwiftUI

struct NotificationView: View {
    @Binding var path: [String]
    @Binding var title: String
    
    @State private var selectedHour: Int = 11  // 기본 시간: 오전 9시
    @State private var selectedMinute: Int = 52 // 기본 분: 00분
    

    var body: some View {
        VStack(spacing: 20) {
            Color.primaryWhite.ignoresSafeArea()
            Text("알림 설정")
                .font(.customFontBig)
                .padding()
            
            // 시간 선택기
            HStack {
                Picker("Hour", selection: $selectedHour) {
                    ForEach(0..<24) { hour in
                        Text("\(hour)시").tag(hour).font(.customFont26)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
                Picker("Minute", selection: $selectedMinute) {
                    ForEach(0..<60) { minute in
                        Text("\(minute)분").tag(minute).font(.customFont26)
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            Spacer()
            .frame(height: 150)
            
            
            // 선택한 시간에 알림 예약 버튼
            Button("알림 예약") {
                scheduleNotification()
                
            }
            .font(.customFont26)
            .padding()
            .background(Color.primaryChampangne)
            .foregroundColor(Color.primaryWhite)
            .cornerRadius(10)
        }
        Spacer()
        
        .onAppear {
            NotificationManager.shared.requestNotificationPermission()
        }
    }
    
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "워이~ 몽키"
        content.body = "머릿속의 몽키를 내쫒아주세요"
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("알림 추가 실패: \(error.localizedDescription)")
            } else {
                // 알림이 성공적으로 추가된 후 앱 처음으로 돌아가기
                DispatchQueue.main.async {
                    path.removeAll()  // 변경 가능한 Binding으로 선언된 path 수정
                }
            }
        }
    }
}

#Preview {
    NotificationView(path: .constant([]), title: .constant(""))
}
