//
//  Journal.swift
//  JournalApp
//
//  Created by Norah Alosaimi on 30/05/1448 AH.
//

import Foundation
import SwiftData

// SwiftData model: saved permanently on the device
@Model
final class Journal {
    @Attribute(.unique) var id: UUID
    var title: String
    var content: String
    var date: Date
    var isBookmarked: Bool

    init(
        id: UUID = UUID(),
        title: String,
        content: String,
        date: Date = Date(),
        isBookmarked: Bool = false
    ) {
        self.id = id
        self.title = title
        self.content = content
        self.date = date
        self.isBookmarked = isBookmarked
    }
}

enum SortOption {
    case bookmark
    case entryDate
}
