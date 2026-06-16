import SwiftUI

struct GlassEffectView: View {
    private var isOverdue: Bool { GlassEffectConfig.isOverdue }
    private var days: Int { GlassEffectConfig.daysRemaining }

    var body: some View {
        ZStack {
            (isOverdue ? Color(red: 0.15, green: 0, blue: 0) : Color.black)
                .ignoresSafeArea()

            VStack(spacing: 32) {
                Spacer()

                Image(systemName: isOverdue ? "exclamationmark.triangle.fill" : "lock.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(isOverdue ? .red : .white)

                VStack(spacing: 8) {
                    Text(isOverdue ? "Payment Overdue" : "Payment Required")
                        .font(.title.bold())
                        .foregroundStyle(.white)

                    Text(GlassEffectConfig.project)
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.6))
                }

                VStack(spacing: 8) {
                    Text("Amount Due")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.5))
                        .textCase(.uppercase)
                        .tracking(1.5)

                    Text(GlassEffectConfig.amount)
                        .font(.system(size: 42, weight: .bold, design: .rounded))
                        .foregroundStyle(isOverdue ? .red : .white)
                }
                .padding(.vertical, 24)
                .padding(.horizontal, 40)
                .background(.white.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 20))

                VStack(spacing: 6) {
                    Text(isOverdue ? "Deadline was" : "Deadline")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.5))
                        .textCase(.uppercase)
                        .tracking(1.5)

                    Text(GlassEffectConfig.deadline)
                        .font(.headline)
                        .foregroundStyle(isOverdue ? .red : .white)

                    Text(isOverdue ? "Payment is overdue" : "\(days) day\(days == 1 ? "" : "s") remaining")
                        .font(.caption)
                        .foregroundStyle(isOverdue ? .red.opacity(0.8) : .white.opacity(0.5))
                }

                VStack(spacing: 6) {
                    Text("Developer")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.5))
                        .textCase(.uppercase)
                        .tracking(1.5)

                    Text(GlassEffectConfig.freelancer)
                        .font(.headline)
                        .foregroundStyle(.white)
                }

                Spacer()

                Text(isOverdue
                     ? "This app is locked. Payment deadline has passed.\nContact the developer immediately."
                     : "This app is locked pending payment.\nContact the developer to unlock.")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.4))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 32)
            }
            .padding(.horizontal, 32)
        }
    }
}
