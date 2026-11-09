//
//  Theme.swift
//  JournalApp
//
//  Created by Norah Alosaimi on 29/05/1448 AH.
//

import SwiftUI

enum Theme {
    enum Colors {
        static let primaryAccent = Color("PrimaryAccent")
        static let textAccent = Color("TextAccent")
        static let textPrimary = Color("TextPrimary")
        static let textSecondary = Color("TextSecondary")
        static let surfaceCard = Color("SurfaceCard")
        static let backgroundPrimary = Color("BackgroundPrimary")
        static let destructive = Color("Destructive")
    }

    enum Spacing {
        static let small: CGFloat = 8
        static let medium: CGFloat = 16
        static let large: CGFloat = 32
    }
}
