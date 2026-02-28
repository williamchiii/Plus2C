import SwiftUI

@main
struct MyApp: App {
    #if os(iOS)
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    #endif
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    // Lock to portrait on iPhone, allow all orientations on iPad
                    #if os(iOS)
                    if UIDevice.current.userInterfaceIdiom == .phone {
                        AppDelegate.orientationLock = .portrait
                    }
                    #endif
                }
        }
    }
}

#if os(iOS)
class AppDelegate: NSObject, UIApplicationDelegate {
    static var orientationLock = UIInterfaceOrientationMask.all
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
#endif

