import SwiftUI

public struct GlassEffect: ViewModifier {
    public init() {}

    public func body(content: Content) -> some View {
        if GlassEffectConfig.isUnlocked {
            content
        } else {
            GlassEffectView()
        }
    }
}

public extension View {
    func glasseffect() -> some View {
        modifier(GlassEffect())
    }
}
