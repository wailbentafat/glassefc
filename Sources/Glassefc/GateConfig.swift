import Foundation

public struct GateConfig {
    public let isUnlocked: Bool
    public let freelancerName: String
    public let projectName: String
    public let amount: String

    public init(
        isUnlocked: Bool,
        freelancerName: String,
        projectName: String,
        amount: String
    ) {
        self.isUnlocked = isUnlocked
        self.freelancerName = freelancerName
        self.projectName = projectName
        self.amount = amount
    }
}
