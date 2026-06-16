import SwiftUI

struct GateModifier: ViewModifier {
    let config: GateConfig

    func body(content: Content) -> some View {
        if config.isUnlocked {
            content
        } else {
            GateView(config: config)
        }
    }
}

public extension View {
    func gated(_ config: GateConfig) -> some View {
        modifier(GateModifier(config: config))
    }
}
