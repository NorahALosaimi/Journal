//
//  ViewModels.swift
//  JournalApp
//
//  Created by Norah Alosaimi on 05/06/1448 AH.
//

import SwiftUI

// ============================================================
// THE CLASS: the "storage box" that holds the app's data.
// @Observable = when any value inside changes, the screen
// updates itself automatically.
// ============================================================
@Observable
class JournalViewModel {

    // ------------------------------------------------------------
    // All the journals.
    // [Journal] = a list of journals
    // []        = empty at the start (so the "Begin Your Journal"
    //             screen shows)
    // ------------------------------------------------------------
    var journals: [Journal] = []

    // ------------------------------------------------------------
    // The text the user types in the search bar.
    // "" = empty at the start
    // ------------------------------------------------------------
    var searchText = ""

    // ------------------------------------------------------------
    // The current sort type.
    // .entryDate = by date (newest first)
    // The other option: .bookmark = bookmarked journals on top
    // ------------------------------------------------------------
    var sortOption: SortOption = .entryDate

    // ------------------------------------------------------------
    // The journal the user tapped 🗑 on, waiting for confirmation.
    // The ? means "can be empty"
    // nil = no journal selected, so the delete alert is hidden
    // ------------------------------------------------------------
    var journalToDelete: Journal? = nil

    // ------------------------------------------------------------
    // The ID of the card that is currently swiped open
    // (the one showing the 🗑 button).
    // nil = no card is swiped
    // ------------------------------------------------------------
    var swipedID: UUID? = nil
}
