import SwiftUI
import SwiftData

@main
struct MyApp: App {
    // Controls whether the splash screen is visible
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
        ZStack {
        if showSplash {
            SplashView()
            } else {
            MainView()
                }
            }
            .task {
                // Wait 2 seconds, then switch to MainView
                try? await Task.sleep(for: .seconds(2))
                withAnimation { showSplash = false }
            }
        }
        // Creates the database and shares it with all screens
        .modelContainer(for: Journal.self)
    }
}
