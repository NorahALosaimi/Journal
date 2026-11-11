//
//  HeaderButtons.swift
//  JournalApp
//
//  Created by Norah Alosaimi on 01/06/1448 AH.
//

import SwiftUI

struct HeaderButtons: View {
    var onFilter: () -> Void = {}
    var onAdd: () -> Void = {}

    var body: some View {
        HStack(spacing: Theme.Spacing.medium) {
            Button(action: onFilter) {
                Image(systemName: "line.3.horizontal.decrease")
            }

            Button(action: onAdd) {
                Image(systemName: "plus")
            }
        }
        .font(.system(size: 20))
        .foregroundColor(Theme.Colors.textPrimary)
        .padding(.horizontal, Theme.Spacing.medium)
        .padding(.vertical, Theme.Spacing.small)
        .background(Theme.Colors.surfaceCard)
        .clipShape(Capsule())
    }
}

#Preview {
    HeaderButtons()
        .padding()
        .background(Theme.Colors.backgroundPrimary)
}
