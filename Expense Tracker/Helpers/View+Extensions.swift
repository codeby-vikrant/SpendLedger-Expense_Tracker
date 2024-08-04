//
//  View+Extensions.swift
//  Expense Tracker
//
//  Created by Vikrant Vani on 04/08/24.
//

import SwiftUI

extension View{
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View{
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vSpacing(_ alignment: Alignment = .center) -> some View{
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    var safeArea: UIEdgeInsets{
        if let windowScene = (UIApplication.shared.connectedScenes.first as? UIWindowScene){
            return windowScene.keyWindow?.safeAreaInsets ?? .zero
        }
        return .zero
    }
}
