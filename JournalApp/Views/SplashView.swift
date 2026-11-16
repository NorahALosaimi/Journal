//
//  SplashView.swift
//  JournalApp
//
//  Created by Norah Alosaimi on 06/06/1448 AH.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Theme.Colors.backgroundPrimary,
                    Theme.Colors.surfaceCard
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: Theme.Spacing.small) {
                Image("NotebookIllustration")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)

                Text("Journali")
                    .font(Theme.Fonts.headingL)
                    .foregroundColor(Theme.Colors.textPrimary)

                Text("Your thoughts, your story")
                    .font(Theme.Fonts.captionM)
                    .foregroundColor(Theme.Colors.textSecondary)
            }
        }
    }
}

#Preview {
    SplashView()
}
