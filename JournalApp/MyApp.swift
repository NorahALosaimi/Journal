import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark)
                .tint(Theme.Colors.textAccent)        }
    }
}
