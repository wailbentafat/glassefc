import SwiftUI

public struct GateView: View {
    let config: GateConfig

    public init(config: GateConfig) {
        self.config = config
    }

    public var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 32) {
                Spacer()

                Image(systemName: "lock.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(.white)

                VStack(spacing: 8) {
                    Text("Payment Required")
                        .font(.title.bold())
                        .foregroundStyle(.white)

                    Text(config.projectName)
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.6))
                }

                VStack(spacing: 8) {
                    Text("Amount Due")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.5))
                        .textCase(.uppercase)
                        .tracking(1.5)

                    Text(config.amount)
                        .font(.system(size: 42, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                }
                .padding(.vertical, 24)
                .padding(.horizontal, 40)
                .background(.white.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 20))

                VStack(spacing: 6) {
                    Text("Developer")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.5))
                        .textCase(.uppercase)
                        .tracking(1.5)

                    Text(config.freelancerName)
                        .font(.headline)
                        .foregroundStyle(.white)
                }

                Spacer()

                Text("This app is locked pending payment.\nContact the developer to unlock.")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.4))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 32)
            }
            .padding(.horizontal, 32)
        }
    }
}
