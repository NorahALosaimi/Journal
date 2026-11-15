import SwiftUI

@Observable
class JournalViewModel {

    // Data
    var journals: [Journal] = []
    var searchText = ""
    var sortOption: SortOption = .entryDate
    var journalToDelete: Journal? = nil
    var swipedID: UUID? = nil

    // Search + sort result
    var filteredJournals: [Journal] {
        let result = searchText.isEmpty ? journals : journals.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.content.localizedCaseInsensitiveContains(searchText)
        }
        switch sortOption {
        case .bookmark:  return result.sorted { $0.isBookmarked && !$1.isBookmarked }
        case .entryDate: return result.sorted { $0.date > $1.date }
        }
    }

    // Actions
    func add(title: String, content: String) {
        journals.insert(Journal(title: title, content: content, date: Date()), at: 0)
    }

    func toggleBookmark(_ journal: Journal) {
        if let i = journals.firstIndex(where: { $0.id == journal.id }) {
            journals[i].isBookmarked.toggle()
        }
    }

    func askDelete(_ journal: Journal) {
        swipedID = nil
        journalToDelete = journal
    }

    func confirmDelete() {
        if let j = journalToDelete { journals.removeAll { $0.id == j.id } }
        cancelDelete()
    }

    func cancelDelete() {
        journalToDelete = nil
        swipedID = nil
    }
}
