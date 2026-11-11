//
//  PrimaryButton.swift
//  JournalApp
//
//  Created by Norah Alosaimi on 01/06/1448 AH.
//

import SwiftUI

struct PrimaryButton: View {
    var systemImage: String = "checkmark"
    var action: () -> Void = {}

    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Theme.Colors.backgroundPrimary)
                .frame(width: 44, height: 44)
                .background(Theme.Colors.primaryAccent)
                .clipShape(Circle())
        }
    }
}

#Preview {
    
        PrimaryButton()
            .padding()
            .background(Theme.Colors.backgroundPrimary)
    }

