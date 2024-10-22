import SwiftUI
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("알림 권한 요청 실패: \(error.localizedDescription)")
            } else if granted {
                print("알림 권한 허용됨")
            } else {
                print("알림 권한 거부됨")
            }
        }
    }
    
    func scheduleNotification() -> String {
        let messages = [
            "머릿속의 몽키를 내쫓아주세요",
            "어둠의 놀이동산으로 가고 있습니까?",
            "즉각적인 만족만을 추구하고 계십니까?"
        ]
        
        return messages.randomElement() ?? "머릿속의 몽키를 내쫓아주세요"
    }
    
    func scheduleMultipleNotifications() {
        let content = UNMutableNotificationContent()
        content.title = "워이~ 몽키"
        content.body = scheduleNotification()
        content.sound = .default
        
        let notificationTimes: [(hour: Int, minute: Int)] = [
            (17, 14),
            (10, 0),
            (14, 0),
            (20, 0),
        ]
        
        for time in notificationTimes {
            var dateComponents = DateComponents()
            dateComponents.hour = time.hour
            dateComponents.minute = time.minute
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("알림 추가 실패: \(error.localizedDescription)")
                }
            }
        }
    }
}
