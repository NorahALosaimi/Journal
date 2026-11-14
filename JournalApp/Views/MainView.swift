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
    @State private var journalToDelete: Journal? = nil
    @State private var swipedID: UUID? = nil
    
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
        }                             // قوس ZStack
        
        .sheet(isPresented: $showEditor) {
            // الشيت هنا
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
                                    swipedID = journal.id      // سحب لليسار: يفتح
                                } else if value.translation.width > 40 {
                                    swipedID = nil             // سحب لليمين: يقفل
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
