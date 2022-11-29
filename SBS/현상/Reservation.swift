//
//  Reservation.swift
//  SBS
//
//  Created by Noah's Ark on 2022/11/30.
//

import SwiftUI

struct Reservation: View {
    let url = URL(string: "https://www.instagram.com/phainestha1/")!

    var body: some View {
        contact
    }
}

private extension Reservation {
    var contact: some View {
        VStack {
            Text("예약은 🙏하게 부탁드립니다.")
            Text("미리 알아보시고 연락주세요🙏")
                .padding(.bottom, 20)
            
            Link(destination: url) {
                Text("예약 문의")
            }
        }
    }
}
