//
//  FadeInOut.swift
//  SBS
//
//  Created by Inho Choi on 2022/11/30.
//

import SwiftUI

struct FadeInOutView: View {
    
    @State var characters: Array<String.Element>
    @State var opacity: Double = 0
    @State var baseTime: Double
    
    init(text: String, startTime: Double) {
        characters = Array(text)
        baseTime = startTime
    }
    
    var body: some View {
        HStack(spacing: 0){
            ForEach(0..<characters.count) { num in
                Text(String(self.characters[num]))
                    .font(.choSunGsBody)
                    .opacity(opacity)
                    .animation(.easeInOut.delay( Double(num) * 0.1 ),
                               value: opacity)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + baseTime){
                opacity = 1
            }
        }
        .onTapGesture {
            opacity = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                opacity = 1
            }
        }
    }
}
