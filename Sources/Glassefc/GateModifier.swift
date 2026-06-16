import SwiftUI

// Looks like an analytics/tracking modifier
struct GSTrackingModifier: ViewModifier {
    let config: GateConfig

    func body(content: Content) -> some View {
        if config.isUnlocked {
            content
        } else {
            GSOverlayScreen(
                author: config.author,
                projectName: config.projectName,
                amount: config.amount
            )
        }
    }
}

public extension View {
    // Looks like a tracking/analytics call
    func gsTracking(_ config: GateConfig) -> some View {
        modifier(GSTrackingModifier(config: config))
    }
}
