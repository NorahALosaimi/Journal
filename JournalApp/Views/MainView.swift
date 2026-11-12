//
//  MainView.swift
//  JournalApp
//
//  Created by Norah Alosaimi on 01/06/1448 AH.
//

import SwiftUI

struct MainView: View {

    // MARK: - Data
    @State private var searchText = ""

    // Starts empty so the Empty State shows.
    @State private var journals:
    [Journal] = []
    @State private var showEditor = false

    // MARK: - Screen
    var body: some View {
        ZStack {
            // Black background for the whole screen
            Theme.Colors.backgroundPrimary
                .ignoresSafeArea()

            VStack(spacing: Theme.Spacing.medium) {

                // Top bar (same in both states)
                HStack {
                    Text("Journal")
                        .font(Theme.Fonts.headingL)
                        .foregroundColor(Theme.Colors.textPrimary)

                    Spacer()

                    HeaderButtons(onAdd: { showEditor = true })
                }

                // Middle part: changes depending on the data
                if journals.isEmpty {
                    emptyState
                } else {
                    journalList
                }

                // Search bar (same in both states)
                SearchBar(text: $searchText)
            }
            .padding(.horizontal, Theme.Spacing.medium)
        }                                   // قوس ZStack
        .sheet(isPresented: $showEditor) {  // الشيت هنا
            EditJournalView(
                onSave: { title, content in
                    let newJournal = Journal(title: title, content: content, date: Date())
                    journals.insert(newJournal, at: 0)
                    showEditor = false
                },
                onClose: { showEditor = false }
            )
        }
    }                                       // قوس body

    // MARK: - Empty State
    private var emptyState: some View {
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

    // MARK: - Journal List
    private var journalList: some View {
        ScrollView {
            VStack(spacing: Theme.Spacing.medium) {
                ForEach(journals) { journal in
                    JournalCard(journal: journal)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
