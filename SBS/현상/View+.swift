//
//  View+.swift
//  SBS
//
//  Created by Noah's Ark on 2022/11/30.
//

import SwiftUI

extension View {
    func customFontSetting() -> some View {
        modifier(FontModifier())
    }
    
    func customFontSmall() -> some View {
        modifier(FontModifier2())
    }

}

struct FontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("ChosunGs", size: 32))
    }
}

struct FontModifier2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("ChosunGs", size: 18))
    }
}
