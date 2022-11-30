//
//  WayToCome.swift
//  SBS
//
//  Created by Noah's Ark on 2022/11/30.
//

import SwiftUI
import UniformTypeIdentifiers

struct WayToCome: View {
    let isFirst: Bool
    let address = "경상북도 포항시 지곡로 102 포스빌 3동 304호"
    @State var isCopy = false
    var body: some View {
        ZStack {
            VStack {
                Group {
                    Text("경상북도 포항시 지곡로 102 포스빌 3동 304호")
                    Text("탭해서 주소 복사하기")
                        .font(.caption2)
                }
                    .onTapGesture {
                        UIPasteboard.general.setValue(address, forPasteboardType: UTType.plainText.identifier)
                        withAnimation(.spring()) {
                            isCopy = true
                        }
                        Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { _ in
                            withAnimation(.spring()) {
                                isCopy = false
                            }
                        }
                    }
                Image(isFirst ? "wayToCome" : "wayToCome2")
                    .resizable()
                    .scaledToFit()
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                if isCopy {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.black)
                            .cornerRadius(20)
                        Text("주소가 복사되었습니다.")
                            .foregroundColor(.white)
                    }
                        .frame(width: UIScreen.main.bounds.width - 60, height: 52)
                        .padding(.bottom, 40)
                }
            }
        }
            .navigationTitle("오시는 길")
            .navigationBarTitleDisplayMode(.large)
        
        
    }
}
