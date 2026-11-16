//
//  JournalListView.swift
//  JournalApp
//
//  Created by Norah Alosaimi on 05/06/1448 AH.
//

import SwiftUI

// THE VIEW: shows the list of journal cards.
// It does NOT store data. It receives everything from outside.
struct JournalListView: View {
    
    // DATA coming from MainView
    let journals: [Journal]           // the journals to show
    let swipedID: UUID?               // which card is swiped open
    let journalToDelete: Journal?
    // which card is waiting for delete
    
    
// ACTIONS (what to do when something happens; MainView decides)
    
    var onBookmark: (Journal) -> Void = { _ in }
    var onSwipe: (UUID?) -> Void = { _ in }
    var onDeleteTap: (Journal) -> Void = { _ in }
    var onTap: (Journal) -> Void = { _ in }
    
    var body: some View {
        ScrollView {
    VStack(spacing: Theme.Spacing.medium) {
    ForEach(journals) { journal in
                    
// Width of the red 🗑 button (+ gap)
    let buttonWidth: CGFloat = 48 + Theme.Spacing.small
                    
    // Is this card slid open?
    let isOpen = swipedID == journal.id || journalToDelete?.id == journal.id
                    
    HStack(spacing: Theme.Spacing.small) {
                        
    // The card + its bookmark action
    JournalCard(journal: journal, onBookmark: {
    onBookmark(journal)
                        })
    .onTapGesture { onTap(journal) }
                        
    // The red delete button
     Button {
  onDeleteTap(journal)
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
    onSwipe(journal.id)
    
    // swipe left: open
} else if value.translation.width > 40 {
onSwipe(nil)
    // swipe right: close
                                }
                            }
                    )
                }
            }
        }
    }
}

#Preview {
    JournalListView(
        journals: [Journal(title: "My Birthday", content: "Lorem ipsum", date: Date())],
        swipedID: nil,
        journalToDelete: nil
    )
    .background(Theme.Colors.backgroundPrimary)
}
