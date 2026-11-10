//
//  SearchBar.swift
//  JournalApp
//
//  Created by Norah Alosaimi on 30/05/1448 AH.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack(spacing: Theme.Spacing.small) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 20))
                .foregroundColor(Theme.Colors.textSecondary)

            TextField("Search", text: $text)
                .textFieldStyle(.plain)
                .font(Theme.Fonts.bodyM)
                .foregroundColor(Theme.Colors.textPrimary)

            Image(systemName: "mic.fill")
                .font(.system(size: 20))
                .foregroundColor(Theme.Colors.textSecondary)
        }
        .padding(.horizontal, Theme.Spacing.medium)
        .padding(.vertical, 12)
        .background(Theme.Colors.surfaceCard)
        .clipShape(Capsule())
    }
}

#Preview {
    SearchBar(text: .constant(""))
        .padding()
        .background(Theme.Colors.backgroundPrimary)
}
