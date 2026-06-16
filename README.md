# Glassefc

A Swift Package that protects freelance work by locking the app until payment is confirmed. Transparent, agreed upfront in the contract — not a hack, a professional payment gate.

---

## How it works

1. You fork this repo and fill in your info in the config
2. You add the package to the client's project
3. Client's code shows only `.glasseffect()` — nothing revealing
4. App is locked on launch until you flip `isUnlocked = true` after payment

---

## Setup (after forking)

Edit one file — `Sources/Glassefc/GlassEffectConfig.swift`:

```swift
enum GlassEffectConfig {
    static let isUnlocked   = false          // → true after payment
    static let freelancer   = "Your Name"
    static let project      = "Project Name"
    static let amount       = "500 USD"
    static let deadline     = "01 jan 2025"  // shown on screen
}
```

---

## Add to client project

In Xcode: `File → Add Package Dependencies`

```
https://github.com/wailbentafat/glassefc
```

---

## Integration (one line)

```swift
import SwiftUI
import Glassefc

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .glasseffect()   // that's it
        }
    }
}
```

---

## Unlocking after payment

1. Go to your fork on GitHub
2. Open `Sources/Glassefc/GlassEffectConfig.swift`
3. Change `isUnlocked = false` → `isUnlocked = true`
4. Push
5. Tell client: `File → Packages → Update to Latest Package Versions`

App unlocks immediately.

---

## Deadline handling

- Before deadline → black screen, lock icon, days remaining shown
- After deadline → dark red screen, warning icon, "Payment Overdue" message — automatic, no code change needed

---

## Requirements

- iOS 16+
- Swift 5.9+
- SwiftUI
