//
//  EditJournalView.swift
//  JournalApp
//
//  Created by Norah Alosaimi on 02/06/1448 AH.
//

import SwiftUI

struct EditJournalView: View {

    // MARK: - Actions (the screen that opens this view decides what they do)
    var onSave: (String, String) -> Void = { _, _ in }
    var onClose: () -> Void = {}

    // MARK: - Data typed by the user
    @State private var title = ""
    @State private var content = ""

    var body: some View {
        ZStack {
            Theme.Colors.surfaceCard
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: Theme.Spacing.medium) {

                // Top bar: close (✕) on the left, save (✓) on the right
                HStack {
                    PrimaryButton(systemImage: "xmark", isDark: true, action: onClose)

                    Spacer()

                    PrimaryButton(systemImage: "checkmark") {
                        onSave(title, content)
                    }
                }

                // Title field
                TextField("", text: $title, prompt: Text("Title").foregroundColor(Theme.Colors.textSecondary))
                    .font(Theme.Fonts.headingM)
                    .foregroundColor(Theme.Colors.textPrimary)

                // Date (today)
                Text(Date().formatted(date: .numeric, time: .omitted))
                    .font(Theme.Fonts.captionS)
                    .foregroundColor(Theme.Colors.textSecondary)

                // Content field (multi-line)
                TextField("", text: $content, prompt: Text("Type your Journal...").foregroundColor(Theme.Colors.textSecondary), axis: .vertical)
                    .font(Theme.Fonts.bodyL)
                    .foregroundColor(Theme.Colors.textPrimary)

                Spacer()
            }
            .padding(Theme.Spacing.medium)
        }
    }
}

#Preview {
    EditJournalView()
}
