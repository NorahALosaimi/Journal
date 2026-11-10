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
    

    enum Fonts {
        static let display = Font.system(size: 42, weight: .black)
        static let headingL = Font.system(size: 34, weight: .bold)
        static let headingM = Font.system(size: 24, weight: .bold)
        static let titleCard = Font.system(size: 24, weight: .semibold)
        static let bodyL = Font.system(size: 20, weight: .regular)
        static let bodyM = Font.system(size: 18, weight: .regular)
        static let bodySupporting = Font.system(size: 18, weight: .light)
        static let captionM = Font.system(size: 16, weight: .regular)
        static let captionS = Font.system(size: 14, weight: .regular)
    }
}
