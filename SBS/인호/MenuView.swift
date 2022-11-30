//
//  MenuView.swift
//  SBS
//
//  Created by Inho Choi on 2022/11/30.
//

import SwiftUI

struct MenuView: View {
    @State var pageIndex = 0
    @State var timer: Timer? = nil
    var body: some View {
        TabView(selection: $pageIndex) {
            Image("china")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .tag(0)
            
            Image("korea")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .tag(1)
            
            Image("japan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .tag(2)
        }
        .navigationTitle("차림표")
        .navigationBarTitleDisplayMode(.large)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .onTapGesture {
            if let timer = timer {
                timer.invalidate()
            }
        }
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .black
            UIPageControl.appearance().pageIndicatorTintColor = .lightGray
            
            timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                withAnimation(.spring()) {
                    if pageIndex + 1 > 2 {
                        pageIndex = (pageIndex + 1) % 3
                    } else {
                        pageIndex += 1
                    }
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
