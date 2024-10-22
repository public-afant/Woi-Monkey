import SwiftUI

struct NotificationView: View {
    @Binding var path: [String]
    @Binding var title: String
    
    @State private var selectedHour: Int = 0
    @State private var selectedMinute: Int = 0
    
    var body: some View {
        ZStack {
            Color.primaryWhite.ignoresSafeArea()
            VStack {
                VStack {
                    Text("다음 집중시간 알림을 설정해주세요")
                        .font(.customFont26)
                    
                    HStack {
                        Picker("Hour", selection: $selectedHour) {
                            ForEach(0..<24) { hour in
                                Text("\(hour)시").tag(hour).font(.customFont18)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        Picker("Minute", selection: $selectedMinute) {
                            ForEach(0..<60) { minute in
                                Text("\(minute)분").tag(minute).font(.customFont18)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                    }
                    .frame(height: 150)
                    Button(action: {
                        path.removeAll()
                    }) {
                        Text("설 정")
                            .font(.customFont26)
                            .frame(width: 200, height: 50)
                            .background(Color.primaryColor)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                    //                    ButtonView(
                    //                        title: "설 정",
                    //                        backgroundColor: .primaryColor,
                    //                        size: 25,
                    //                        action: {path.append("TimerView")}
                    //                    )
                }
                .padding(.horizontal, 30.0)
                .padding(.top, 40.0)
                .padding(.bottom, 30.0)
                .background(Color.primaryChampangne)
                .cornerRadius(15)
            }
            .padding(.horizontal, 20.0)
        }.navigationBarItems(leading: BackButton(path: $path))
            .onAppear {
                // Date.now를 사용하여 현재 시간 설정
                let currentDate = Date.now
                let calendar = Calendar.current
                selectedHour = calendar.component(.hour, from: currentDate)
                selectedMinute = calendar.component(.minute, from: currentDate)
                
                NotificationManager.shared.requestNotificationPermission()
            }
    }
}
//    
//    
//    func scheduleNotification() {
//        let content = UNMutableNotificationContent()
//        content.title = "워이~ 몽키"
//        content.body = "머릿속의 몽키를 내쫒아주세요"
//        content.sound = .default
//
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//
//        UNUserNotificationCenter.current().add(request) { error in
//            if let error = error {
//                print("알림 추가 실패: \(error.localizedDescription)")
//            } else {
//                // 알림이 성공적으로 추가된 후 앱 처음으로 돌아가기
//                DispatchQueue.main.async {
//                    path.removeAll()  // 변경 가능한 Binding으로 선언된 path 수정
//                }
//            }
//        }
//    }

#Preview {
    NotificationView(path: .constant([]), title: .constant(""))
}
