import Foundation

// Run this locally to generate the unlock key for a project.
// Never ship this file in the client's project.
public enum KeyGenerator {
    public static func generateKey(projectName: String, author: String) -> String {
        var hash: UInt64 = 5381
        for char in (projectName + author).unicodeScalars {
            hash = (hash &* 31) &+ UInt64(char.value)
        }
        return "GS-" + String(hash, radix: 36, uppercase: true)
    }
}
