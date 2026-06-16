// ── EDIT THIS FILE AFTER FORKING ──────────────────────────────────────────────
// 1. Set your name, project name, and amount
// 2. Leave isUnlocked = false when delivering to client
// 3. After payment: set isUnlocked = true and push — client updates the package
// ──────────────────────────────────────────────────────────────────────────────

enum GlassEffectConfig {
    static let isUnlocked   = false
    static let freelancer   = "Wail Bentafat"
    static let project      = "la mafia"
    static let amount       = "100%"
    static let deadline     = "25 juin 2026"

    // true when past deadline
    static var isOverdue: Bool {
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(identifier: "Africa/Algiers")!
        let components = DateComponents(year: 2026, month: 6, day: 25)
        guard let due = cal.date(from: components) else { return false }
        return Date() > due
    }

    // days remaining until deadline (negative = overdue)
    static var daysRemaining: Int {
        var cal = Calendar(identifier: .gregorian)
        cal.timeZone = TimeZone(identifier: "Africa/Algiers")!
        let components = DateComponents(year: 2026, month: 6, day: 25)
        guard let due = cal.date(from: components) else { return 0 }
        return cal.dateComponents([.day], from: Date(), to: due).day ?? 0
    }
}
