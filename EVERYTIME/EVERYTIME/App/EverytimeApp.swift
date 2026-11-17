import SwiftUI

@main struct EverytimeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TimetableView()
            }
        }
    }
}
