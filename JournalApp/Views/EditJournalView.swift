import SwiftUI

struct EditJournalView: View {

    // Actions (the screen that opens this view decides what they do)
    var onSave: (String, String) -> Void = { _, _ in }
    var onClose: () -> Void = {}

    // Data typed by the user
    @State private var title = ""
    @State private var content = ""
    @State private var showDiscardAlert = false

    var body: some View {
        ZStack {
            Theme.Colors.surfaceCard
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: Theme.Spacing.medium) {

                // Top bar: close (dark) on the left, save on the right
                HStack {
                    PrimaryButton(systemImage: "xmark", isDark: true) {
                        if title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
                           content.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                            onClose()
                        } else {
                            showDiscardAlert = true
                        }
                    }

                    Spacer()

                    PrimaryButton(systemImage: "checkmark") {
                        onSave(title, content)
                    }
                }

                // Title field
                TextField("", text: $title, prompt: Text("Title").foregroundColor(Theme.Colors.textSecondary))
                    .font(Theme.Fonts.headingL)
                    .foregroundColor(Theme.Colors.textPrimary)
                    .tint(Theme.Colors.textAccent)

                // Date (today)
                Text(Date().formatted(date: .numeric, time: .omitted))
                    .font(Theme.Fonts.captionM)
                    .foregroundColor(Theme.Colors.textSecondary)

                // Content field (multi-line)
                TextField("", text: $content, prompt: Text("Type your Journal...").foregroundColor(Theme.Colors.textSecondary), axis: .vertical)
                    .font(Theme.Fonts.bodyL)
                    .foregroundColor(Theme.Colors.textPrimary)
                    .tint(Theme.Colors.textAccent)

                Spacer()
            }
            .padding(Theme.Spacing.medium)
            if showDiscardAlert {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture { showDiscardAlert = false }

                VStack {
                    DiscardAlert(
                        onDiscard: {
                        showDiscardAlert = false
                            onClose()
                        },
                        onKeepEditing:{showDiscardAlert = false }
                    )
                    Spacer()
                }
                .padding(.top, Theme.Spacing.small)
            }
               
            }
        }
    }


#Preview {
    EditJournalView()
}
