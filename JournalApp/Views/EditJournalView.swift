import SwiftUI

struct EditJournalView: View {

    
// PART 1: ACTIONS
// What happens on save / close. The screen that opens this
// view (MainView) decides what they do.
   
    var onSave: (String, String) -> Void
    var onClose: () -> Void

   
// PART 2: DATA
// title / content = what the user is typing
// displayDate     = the date shown under the title
// showDiscardAlert = is the "discard changes?" alert visible
    @State private var title: String
    @State private var content: String
    @State private var showDiscardAlert = false
    private let displayDate: Date

    
// PART 3: INIT
// journal = nil     -> new journal (empty fields, today's date)
// journal = existing -> editing (fields filled, original date)
    
    init(journal: Journal? = nil,
    onSave: @escaping (String, String) -> Void = { _, _ in },
         onClose: @escaping () -> Void = {}) {
    _title = State(initialValue: journal?.title ?? "")
    _content = State(initialValue: journal?.content ?? "")
    displayDate = journal?.date ?? Date()
    self.onSave = onSave
    self.onClose = onClose
    }

    
    // PART 4: VALIDATION
// The title must have real text (spaces only don't count).
    
    private var isTitleValid: Bool {
    !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

// true if the user typed anything at all (title or content)
    private var hasChanges: Bool {
    !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
    !content.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    
// PART 5: SCREEN LAYOUT
    
    var body: some View {
        ZStack {

// --- Background ---
 Theme.Colors.surfaceCard
            .ignoresSafeArea()

// --- Main content ---
    VStack(alignment: .leading, spacing: Theme.Spacing.medium) {

// Top bar: close (left) + save (right)
                HStack {
// Close button: asks first if there are changes
    PrimaryButton(systemImage: "xmark", isDark: true) {
 if hasChanges {
    showDiscardAlert = true
                } else {
                onClose()
 }
 }

Spacer()

// Save button: disabled until the title is valid
            PrimaryButton(systemImage: "checkmark") {
            if isTitleValid {
        onSave(title, content)
 }
    }
.opacity(isTitleValid ? 1 : 0.4)
    .disabled(!isTitleValid)
 }

    // Title field
TextField("", text: $title,
prompt: Text("Title").foregroundColor(Theme.Colors.textSecondary))
    .font(Theme.Fonts.headingL)
 .foregroundColor(Theme.Colors.textPrimary)
    .tint(Theme.Colors.textAccent)

        // Date
Text(displayDate.formatted(date: .numeric, time: .omitted))
    .font(Theme.Fonts.captionM)
    .foregroundColor(Theme.Colors.textSecondary)

// Content field (multi-line)
    TextField("", text: $content,
prompt: Text("Type your Journal...").foregroundColor(Theme.Colors.textSecondary),
    axis: .vertical)
    .font(Theme.Fonts.bodyL)
    .foregroundColor(Theme.Colors.textPrimary)
    .tint(Theme.Colors.textAccent)

        Spacer()
    }
    .padding(Theme.Spacing.medium)

// --- Discard alert (only when showDiscardAlert is true) ---
            if showDiscardAlert {
// Dark overlay behind the alert
    Color.black.opacity(0.4)
    .ignoresSafeArea()
    .onTapGesture { showDiscardAlert = false }

// The alert, pushed to the top
    VStack {
    DiscardAlert(
    onDiscard: {
    showDiscardAlert = false
    onClose()
 },
onKeepEditing: { showDiscardAlert = false }
 )
    Spacer()
 }
.padding(.top, Theme.Spacing.large + Theme.Spacing.medium)
            }
        }
    }
}


// PART 6: PREVIEW (Xcode canvas only, not in the real app)

#Preview {
    EditJournalView()
}
