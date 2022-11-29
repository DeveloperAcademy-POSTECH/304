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
            BounceAnimationSmallView(text: subTitle, startTime: 1.5)
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
    
    init(text: String, startTime: Double){
        self.characters = Array(text)
        self.baseTime = startTime
    }
    
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<characters.count) { num in
                Text(String(self.characters[num]))
                    .customFontSetting()
                    .offset(x: 0.0, y: offsetYForBounce)
                    .opacity(opacity)
                    .animation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0.1).delay( Double(num) * 0.1 ), value: offsetYForBounce)
            }
            .onTapGesture {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                    opacity = 0
                    offsetYForBounce = -50
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    opacity = 1
                    offsetYForBounce = 0
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + (0.8 + baseTime)) {
                    opacity = 1
                    offsetYForBounce = 0
                }
            }
        }
    }
}

struct BounceAnimationSmallView: View {
    let characters: Array<String.Element>
    
    @State var offsetYForBounce: CGFloat = -50
    @State var opacity: CGFloat = 0
    @State var baseTime: Double
    
    init(text: String, startTime: Double){
        self.characters = Array(text)
        self.baseTime = startTime
    }
    
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<characters.count) { num in
                Text(String(self.characters[num]))
                    .customFontSmall()
                    .offset(x: 0.0, y: offsetYForBounce)
                    .opacity(opacity)
                    .animation(.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0.1).delay( Double(num) * 0.1 ), value: offsetYForBounce)
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + (0.8 + baseTime)) {
                    opacity = 1
                    offsetYForBounce = 0
                    Timer.scheduledTimer(withTimeInterval: 3.5, repeats: true) { timer in
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

struct Bounce_Previews: PreviewProvider {
    static var previews: some View {
        Bounce(headTitle: .constant("안녕하세요."), subTitle: .constant("어서오세요."))
    }
}
