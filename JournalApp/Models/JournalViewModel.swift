import SwiftUI
import SwiftData

@Observable
class JournalViewModel {

    // MARK: - UI State
    // Note: journals are no longer stored here.
    // They come from SwiftData using @Query in MainView.
    var searchText = ""
    var sortOption: SortOption = .entryDate
    var journalToDelete: Journal? = nil
    var swipedID: UUID? = nil

    // MARK: - Search + sort
    // Takes the saved journals and returns them filtered + sorted
    func filteredJournals(_ journals: [Journal]) -> [Journal] {
    let result = searchText.isEmpty ? journals : journals.filter {
        $0.title.localizedCaseInsensitiveContains(searchText) ||
        $0.content.localizedCaseInsensitiveContains(searchText)
        }
        switch sortOption {
    case .bookmark:  return result.sorted { $0.isBookmarked && !$1.isBookmarked }
    case .entryDate: return result.sorted { $0.date > $1.date }
        }
    }

    // MARK: - Actions
    // Saves a new journal to the database
    func add(title: String, content: String, in context: ModelContext) {
    let journal = Journal(title: title, content: content, date: Date())
        context.insert(journal)
    }

    // Journal is a class now, so changing it saves automatically
    func update(_ journal: Journal, title: String, content: String) {
        journal.title = title
        journal.content = content
    }

    func toggleBookmark(_ journal: Journal) {
        journal.isBookmarked.toggle()
    }

    func askDelete(_ journal: Journal) {
        swipedID = nil
        journalToDelete = journal
    }

    // Removes the journal from the database
    func confirmDelete(in context: ModelContext) {
        if let journal = journalToDelete {
            context.delete(journal)
        }
        cancelDelete()
    }

    func cancelDelete() {
        journalToDelete = nil
        swipedID = nil
    }
}
