import SwiftUI

struct MainView: View {
    @State private var viewModel = JournalViewModel()
    @State private var showEditor = false
    @State private var journalToEdit: Journal? = nil
    
    
    var body: some View {
        ZStack {
        Theme.Colors.backgroundPrimary.ignoresSafeArea()
            
    VStack(spacing: Theme.Spacing.medium) {
        HStack {
        Text("Journal")
     .font(Theme.Fonts.headingL)
    .foregroundColor(Theme.Colors.textPrimary)
        Spacer()
    HeaderButtons(sortOption: $viewModel.sortOption, onAdd: { showEditor = true })
                }
                
    if viewModel.journals.isEmpty {
        EmptyStateView()
        } else {
        JournalListView(
        journals: viewModel.filteredJournals,
        
        
        swipedID: viewModel.swipedID,
        
    journalToDelete: viewModel.journalToDelete,
        
onBookmark: { viewModel.toggleBookmark($0) },
        
    onSwipe: { viewModel.swipedID = $0 },
        
    onDeleteTap: { viewModel.askDelete($0) },

    onTap: { journalToEdit = $0 },
        
        )
                }
                
    SearchBar(text: $viewModel.searchText)
            }
   .padding(.horizontal, Theme.Spacing.medium)
            
if viewModel.journalToDelete != nil {
        Color.black.opacity(0.6)
        .ignoresSafeArea()
    .onTapGesture { viewModel.cancelDelete() }
                
        DeleteAlert(
    onCancel: { viewModel.cancelDelete() },
    onDelete: { viewModel.confirmDelete() }
                )
            }
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $showEditor) {
            EditJournalView(
    onSave: { title, content in
    viewModel.add(title: title, content: content)
        showEditor = false
                },
    onClose: { showEditor = false }
    
            )
        }
 .sheet(item: $journalToEdit) { journal in
     EditJournalView(
     journal: journal,
    onSave: { title, content in
    viewModel.update(journal, title: title, content: content)
    journalToEdit = nil
    },
    onClose: { journalToEdit = nil }
            )
        }
    }
}

#Preview {
    MainView()
}
