//
//  JournalCard.swift
//  JournalApp
//
//  Created by Norah Alosaimi on 30/05/1448 AH.
//

import SwiftUI

struct JournalCard: View {
    let journal: Journal

    var body: some View {
        VStack(alignment: .leading, spacing: Theme.Spacing.small) {
            HStack {
                Text(journal.title)
                    .font(Theme.Fonts.titleCard)
                    .foregroundColor(Theme.Colors.textAccent)

                Spacer()

                Image(systemName: journal.isBookmarked ? "bookmark.fill" : "bookmark")
                    .foregroundColor(Theme.Colors.primaryAccent)
            }

            Text(journal.date.formatted(date: .numeric, time: .omitted))
                .font(Theme.Fonts.captionS)
                .foregroundColor(Theme.Colors.textSecondary)

            Text(journal.content)
                .font(Theme.Fonts.captionM)
                .foregroundColor(Theme.Colors.textPrimary)
                .lineLimit(3)
        }
        .padding(Theme.Spacing.medium)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Theme.Colors.surfaceCard)
        .cornerRadius(12)
    }
}

#Preview {
    JournalCard(journal: Journal(
        title: "My Birthday",
        content: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros.",
        date: Date(),
        isBookmarked: true
    ))
    .padding()
    .background(Theme.Colors.backgroundPrimary)
}
