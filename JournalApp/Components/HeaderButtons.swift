//
//  HeaderButtons.swift
//  JournalApp
//
//  Created by Norah Alosaimi on 01/06/1448 AH.
//
import SwiftUI

struct HeaderButtons: View {
    @Binding var sortOption: SortOption
    var onAdd: () -> Void = {}
    
    var body: some View {
        HStack(spacing: Theme.Spacing.medium) {
            
            // Filter menu: opens two options
    Menu {
 Picker("Sort", selection: $sortOption) {
 Text("Sort by Bookmark").tag(SortOption.bookmark)
    Text("Sort by Entry Date").tag(SortOption.entryDate)
                }
            } label: {
    Image(systemName: "line.3.horizontal.decrease")
            }
            
            // Add button
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
    HeaderButtons(sortOption: .constant(.entryDate))
        .padding()
        .background(Theme.Colors.backgroundPrimary)
}
