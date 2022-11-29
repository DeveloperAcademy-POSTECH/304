//
//  WayToCome.swift
//  SBS
//
//  Created by Noah's Ark on 2022/11/30.
//

import SwiftUI

struct WayToCome: View {
    var body: some View {
        map
    }
}

private extension WayToCome {
    var guidingText: some View {
        ZStack {
            Image("rose")
                .resizable()
                .frame(width: 150, height: 150)
            Text("어서오십시요.")
                .bold()
                .underline()
                .foregroundColor(.white)
                .background(.black.opacity(0.8))
        }
    }
    
    var map: some View {
        VStack {
            Image("wayToCome")
                .resizable()
                .scaledToFit()
        }
    }
}
