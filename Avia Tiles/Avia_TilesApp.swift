import SwiftUI

@main
struct Avia_TilesApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
                .onAppear {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                        } else if let error {
                        }
                        UNUserNotificationCenter.current().delegate = NotificationDelegate()
                    }
                }
        }
    }
}

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
}
