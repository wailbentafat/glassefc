import Foundation

public struct GateConfig {
    let licenseKey: String
    let author: String
    let projectName: String
    let amount: String

    // Key must be: "GS-" + SHA of (projectName + author)
    var isUnlocked: Bool {
        guard licenseKey.hasPrefix("GS-") else { return false }
        let payload = licenseKey.dropFirst(3)
        let expected = simpleHash(projectName + author)
        return payload == expected
    }

    public init(
        licenseKey: String,
        author: String,
        projectName: String,
        amount: String
    ) {
        self.licenseKey = licenseKey
        self.author = author
        self.projectName = projectName
        self.amount = amount
    }

    private func simpleHash(_ input: String) -> String {
        var hash: UInt64 = 5381
        for char in input.unicodeScalars {
            hash = (hash &* 31) &+ UInt64(char.value)
        }
        return String(hash, radix: 36, uppercase: true)
    }
}
