//
//  FileEmptyStateView.swift
//  JournalApp
//
//  Created by Norah Alosaimi on 05/06/1448 AH.
//
import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: Theme.Spacing.medium) {
            Spacer()

            Image("BookIllustration")
                .resizable()
                .scaledToFit()
                .frame(width: 200)

            Text("Begin Your Journal")
                .font(Theme.Fonts.headingM)
                .foregroundColor(Theme.Colors.textAccent)

            Text("Craft your personal diary, tap the plus icon to begin")
                .font(Theme.Fonts.bodyM)
                .foregroundColor(Theme.Colors.textPrimary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, Theme.Spacing.large)

            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    EmptyStateView()
        .background(Theme.Colors.backgroundPrimary)
}
