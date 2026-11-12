//
//  PrimaryButton.swift
//  JournalApp
//
//  Created by Norah Alosaimi on 01/06/1448 AH.
//
import SwiftUI

struct PrimaryButton: View {
    var systemImage: String = "checkmark"
    var isDark: Bool = false
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(isDark ? Theme.Colors.textPrimary : Theme.Colors.backgroundPrimary)
                .frame(width: 40, height: 40)
                .background(isDark ? Theme.Colors.backgroundPrimary : Theme.Colors.primaryAccent)
                .clipShape(Circle())
        }
    }
}

#Preview {
    HStack {
        PrimaryButton(systemImage: "xmark", isDark: true)
        PrimaryButton()
    }
    .padding()
    .background(Theme.Colors.surfaceCard)
}

