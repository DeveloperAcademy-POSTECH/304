//
//  Bounce.swift
//  SBS
//
//  Created by Inho Choi on 2022/12/02.
//

import SwiftUI

struct Bounce: View {
    @Binding var headTitle: String
    @Binding var subTitle: String
    var body: some View {
        VStack {
            BounceAnimationView(text: headTitle, startTime: 0.0)
            BounceAnimationView(text: subTitle, startTime: 1.5)
                .padding(.top, 10)
        }
    }
}

struct BounceAnimationView: View {
    let characters: Array<String.Element>
    
    @State var offsetYForBounce: CGFloat = -50
    @State var opacity: CGFloat = 0
    @State var baseTime: Double
    @State var isgo = true
    @State var timer: Timer? = nil
    
    init(text: String, startTime: Double){
        self.characters = Array(text)
        self.baseTime = startTime
    }
    
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<characters.count) { num in
                Text(String(self.characters[num]))
                    .font(.choSunGsBody)
                    .offset(x: 0.0, y: offsetYForBounce)
                    .opacity(opacity)
                    .animation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0.1).delay( Double(num) * 0.1 ), value: offsetYForBounce)
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + (0.8 + baseTime)) {
                    opacity = 1
                    offsetYForBounce = 0
                    if timer == nil {
                        timer = Timer.scheduledTimer(withTimeInterval: 3.5, repeats: true) { timer in
                            if isgo {
                                opacity = 1
                                offsetYForBounce = 0
                            } else {
                                opacity = 0
                                offsetYForBounce = -50
                            }
                            isgo.toggle()
                        }
                    }
                }
            }
        }
    }
}
