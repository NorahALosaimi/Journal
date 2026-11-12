//
//  CustomAlert.swift
//  JournalApp
//
//  Created by Norah Alosaimi on 01/06/1448 AH.
//
import SwiftUI

// MARK: - Delete Alert (title + message + 2 buttons side by side)
struct DeleteAlert: View {

    // Actions: what happens when a button is tapped
    var onCancel: () -> Void = {}
    var onDelete: () -> Void = {}

    var body: some View {
        VStack(alignment: .leading, spacing: Theme.Spacing.small) {

            // Title
            Text("Delete Journal?")
                .font(.subheadline.weight(.semibold))
                .foregroundColor(Theme.Colors.textPrimary)

            // Message
            Text("Are you sure you want to delete this journal?")
                .font(.subheadline)
                .foregroundColor(Theme.Colors.textPrimary.opacity(0.85))

            // Buttons row
            HStack(spacing: Theme.Spacing.small) {

                // Cancel button (gray)
                Button(action: onCancel) {
                    Text("Cancel")
                        .font(.subheadline.weight(.semibold))
                        .foregroundColor(Theme.Colors.textPrimary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, Theme.Spacing.small)
                        .background(Color.white.opacity(0.15))
                        .clipShape(Capsule())
                }

                // Delete button (red)
                Button(action: onDelete) {
                    Text("Delete")
                        .font(.subheadline.weight(.semibold))
                        .foregroundColor(Theme.Colors.textPrimary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, Theme.Spacing.small)
                        .background(Theme.Colors.destructive)
                        .clipShape(Capsule())
                }
            }
            .padding(.top, Theme.Spacing.small)
        }
        // Alert box style
        .padding(Theme.Spacing.medium)
        .containerRelativeFrame(.horizontal) { width, _ in width * 0.75 }
        .background(Color(white: 0.09))
        .clipShape(RoundedRectangle(cornerRadius: 34, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 34, style: .continuous)
                .stroke(Color.white.opacity(0.15), lineWidth: 1)
        )
    }
}

// MARK: - Discard Alert (message + 2 buttons stacked, translucent)
struct DiscardAlert: View {

    // Actions
    var onDiscard: () -> Void = {}
    var onKeepEditing: () -> Void = {}

    var body: some View {
        VStack(alignment: .leading, spacing: Theme.Spacing.medium) {

            // Message (no title in this design)
            Text("Are you sure you want to discard changes on this journal?")
                .font(.subheadline)
                .foregroundColor(Theme.Colors.textPrimary.opacity(0.75))

            // Buttons stacked vertically
            VStack(spacing: Theme.Spacing.small) {

                // Discard button (red text)
                Button(action: onDiscard) {
                    Text("Discard Changes")
                        .font(.subheadline.weight(.medium))
                        .foregroundColor(Theme.Colors.destructive)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, Theme.Spacing.small + 2)
                    .background(Color.white.opacity(0.10))
                        .clipShape(Capsule())
                }

                // Keep Editing button (white text)
                Button(action: onKeepEditing) {
                    Text("Keep Editing")
                        .font(.subheadline.weight(.semibold))
                        .foregroundColor(Theme.Colors.textPrimary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, Theme.Spacing.small + 2)
                        .background(Color.white.opacity(0.10))
                        .clipShape(Capsule())
                }
            }
        }
        // Alert box style
        .padding(Theme.Spacing.medium)
        .containerRelativeFrame(.horizontal) { width, _ in width * 0.75 }
        .background(Color(white: 0.12).opacity(0.85))
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 34, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 34, style: .continuous)
                .stroke(Color.white.opacity(0.15), lineWidth: 1)
        )
    }
}

// MARK: - Preview (not part of the real app)
#Preview {
    ZStack {
        Theme.Colors.surfaceCard.ignoresSafeArea()

        // Fake text behind the alerts so you can see the transparency
        Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.")
            .foregroundColor(Theme.Colors.textPrimary)
            .padding()

        VStack(spacing: 24) {
            DeleteAlert()
            DiscardAlert()
        }
    }
}
