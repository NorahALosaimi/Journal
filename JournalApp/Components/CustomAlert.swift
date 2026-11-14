//
//  CustomAlert.swift
//  JournalApp
//
//  Created by Norah Alosaimi on 01/06/1448 AH.
//
import SwiftUI

// ============================================================
// SECTION 1: DELETE ALERT
// Used when the user swipes a journal and taps the trash button.
// Layout: title + message + 2 buttons SIDE BY SIDE.
// ============================================================
struct DeleteAlert: View {

    // --- ACTIONS (what happens on tap; the screen decides) ---
    var onCancel: () -> Void = {}
    var onDelete: () -> Void = {}

    var body: some View {

        // --- CONTENT (text + buttons) ---
        VStack(alignment: .leading, spacing: Theme.Spacing.small) {

            // Title
            Text("Delete Journal?")
                .font(.subheadline.weight(.semibold))
                .foregroundColor(Theme.Colors.textPrimary)

            // Message
            Text("Are you sure you want to delete this journal?")
                .font(.subheadline)
                .foregroundColor(Theme.Colors.textPrimary.opacity(0.85))

            // Buttons row (side by side)
            HStack(spacing: Theme.Spacing.small) {

                // Cancel button: gray background
                Button(action: onCancel) {
                    Text("Cancel")
                        .font(.subheadline.weight(.semibold))
                        .foregroundColor(Theme.Colors.textPrimary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, Theme.Spacing.small)          // button height
                        .background(Color.white.opacity(0.15))            // button color
                        .clipShape(Capsule())
                }

                // Delete button: red background
                Button(action: onDelete) {
                    Text("Delete")
                        .font(.subheadline.weight(.semibold))
                        .foregroundColor(Theme.Colors.textPrimary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, Theme.Spacing.small)          // button height
                        .background(Theme.Colors.destructive)             // red
                        .clipShape(Capsule())
                }
            }
            .padding(.top, Theme.Spacing.small)
        }

        // --- SIZE (inner spacing + width relative to the screen) ---
        .padding(Theme.Spacing.medium)
        .containerRelativeFrame(.horizontal) { width, _ in width * 0.75 } // 75% of screen width

        // --- BACKGROUND (solid dark) ---
        .background(Color(white: 0.09))

        // --- CORNERS + BORDER ---
        .clipShape(RoundedRectangle(cornerRadius: 34, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 34, style: .continuous)
                .stroke(Color.white.opacity(0.15), lineWidth: 1)
        )
    }
}

// ============================================================
// SECTION 2: DISCARD ALERT
// Used when the user taps ✕ while editing with unsaved text.
// Layout: message only + 2 buttons STACKED vertically. Glass look.
// ============================================================
struct DiscardAlert: View {

    // --- ACTIONS ---
    var onDiscard: () -> Void = {}
    var onKeepEditing: () -> Void = {}

    var body: some View {

        // --- CONTENT (text + buttons) ---
        VStack(alignment: .leading, spacing: Theme.Spacing.small) { 

            // Message (this design has no title)
            Text("Are you sure you want to discard changes on this journal?")
                .font(.subheadline)
                .foregroundColor(Theme.Colors.textPrimary.opacity(0.75))

            // Buttons (stacked vertically)
            VStack(spacing: Theme.Spacing.small) {

                // Discard button: red text
                Button(action: onDiscard) {
                    Text("Discard Changes")
                        .font(.subheadline.weight(.medium))
                        .foregroundColor(Theme.Colors.destructive)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, Theme.Spacing.small + 2)      // button height
                        .background(Color.white.opacity(0.12))            // button color
                        .clipShape(Capsule())
                }

                // Keep Editing button: white text
                Button(action: onKeepEditing) {
                    Text("Keep Editing")
                        .font(.subheadline.weight(.semibold))
                        .foregroundColor(Theme.Colors.textPrimary)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, Theme.Spacing.small)      // button height
                        .background(Color.white.opacity(0.12))            // button color
                        .clipShape(Capsule())
                }
            }
        }

        // --- SIZE (width first, then inner spacing) ---
        .padding(Theme.Spacing.medium)
        .frame(maxWidth: .infinity)
        .containerRelativeFrame(.horizontal) { width, _ in width * 0.76 }

        // --- BACKGROUND (dark tint over blur) ---
        .background(Color.black.opacity(0.85))
        .background(.ultraThinMaterial)

        // --- CORNERS + BORDER ---
        .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .stroke(Color.white.opacity(0.15), lineWidth: 1)
        )
    }
}

// ============================================================
// SECTION 3: PREVIEW (only for Xcode canvas, not in the real app)
// ============================================================
#Preview {
    ZStack {
        Theme.Colors.surfaceCard.ignoresSafeArea()

        // Fake text behind the alerts so the glass effect is visible
        Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.")
            .foregroundColor(Theme.Colors.textPrimary)
            .padding()

        VStack(spacing: 24) {
            DeleteAlert()
            DiscardAlert()
        }
    }
}
