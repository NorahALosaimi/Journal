import SwiftUI

struct MainView: View {

    // MARK: - Data
    @State private var searchText = ""
    @State private var journals: [Journal] = []
    @State private var showEditor = false
    @State private var journalToDelete: Journal? = nil
    @State private var swipedID: UUID? = nil

    // MARK: - Screen
    var body: some View {
        ZStack {
            Theme.Colors.backgroundPrimary
                .ignoresSafeArea()

            VStack(spacing: Theme.Spacing.medium) {

                HStack {
                    Text("Journal")
                        .font(Theme.Fonts.headingL)
                        .foregroundColor(Theme.Colors.textPrimary)

                    Spacer()

                    HeaderButtons(onAdd: { showEditor = true })
                }

                if journals.isEmpty {
                    EmptyStateView()
                } else {
                    journalList
                }

                SearchBar(text: $searchText)
            }
            .padding(.horizontal, Theme.Spacing.medium)

            if let journal = journalToDelete {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .onTapGesture { journalToDelete = nil; swipedID = nil }

                VStack {
                    Spacer()
                    DeleteAlert(
                        onCancel: { journalToDelete = nil; swipedID = nil },
                        onDelete: {
                            journals.removeAll { $0.id == journal.id }
                            journalToDelete = nil
                            swipedID = nil
                        }
                    )
                    Spacer()
                }
            }
        }
        .sheet(isPresented: $showEditor) {
            EditJournalView(
                onSave: { title, content in
                    let newJournal = Journal(title: title, content: content, date: Date())
                    journals.insert(newJournal, at: 0)
                    showEditor = false
                },
                onClose: { showEditor = false }
            )
        }
    }

    // MARK: - Search
    private var filteredJournals: [Journal] {
        if searchText.isEmpty { return journals }
        return journals.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.content.localizedCaseInsensitiveContains(searchText)
        }
    }

    // MARK: - Journal List
    private var journalList: some View {
        ScrollView {
            VStack(spacing: Theme.Spacing.medium) {
                ForEach(filteredJournals) { journal in
                    let buttonWidth: CGFloat = 48 + Theme.Spacing.small
                    let isOpen = swipedID == journal.id || journalToDelete?.id == journal.id

                    HStack(spacing: Theme.Spacing.small) {
                        JournalCard(journal: journal, onBookmark: {
                            if let index = journals.firstIndex(where: { $0.id == journal.id }) {
                                journals[index].isBookmarked.toggle()
                            }
                        })

                        Button {
                            swipedID = nil
                            journalToDelete = journal
                        } label: {
                            Image(systemName: "trash.fill")
                                .foregroundColor(Theme.Colors.textPrimary)
                                .frame(width: 48, height: 48)
                                .background(Theme.Colors.destructive)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.trailing, -buttonWidth)
                    .offset(x: isOpen ? -buttonWidth : 0)
                    .animation(.easeInOut(duration: 0.25), value: isOpen)
                    .gesture(
                        DragGesture(minimumDistance: 20)
                            .onEnded { value in
                                if value.translation.width < -40 {
                                    swipedID = journal.id
                                } else if value.translation.width > 40 {
                                    swipedID = nil
                                }
                            }
                    )
                }
            }
        }
    }
}

#Preview {
    MainView()
}
