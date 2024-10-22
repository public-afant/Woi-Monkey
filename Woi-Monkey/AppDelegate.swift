//
//  AppDelegate.swift
//  Woi-Monkey
//
//  Created by 지니 on 10/21/24.
//

import UIKit
import UserNotifications


class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    // 앱이 시작할 때 알림 델리게이트 설정
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 알림 권한 요청 및 델리게이트 설정
        let center = UNUserNotificationCenter.current()
        center.delegate = self  // 델리게이트 설정
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Error requesting notification authorization: \(error)")
            }
        }
        return true
    }

    // 앱이 포그라운드에 있을 때 알림이 도착하면 실행되는 메서드
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // 앱이 열려있어도 알림을 표시하고 싶다면, 아래 코드를 호출하세요.
        completionHandler([.banner, .sound])
    }

    // 알림을 눌렀을 때 실행되는 메서드
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        // 알림을 눌렀을 때의 동작 처리
        print("알림이 눌렸습니다: \(response.notification.request.content.body)")
        completionHandler()
    }
}
