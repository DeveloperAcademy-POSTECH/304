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
            Text("μμ½μ πνκ² λΆνλλ¦½λλ€.")
            Text("λ―Έλ¦¬ μμλ³΄μκ³  μ°λ½μ£ΌμΈμπ")
                .padding(.bottom, 20)
            
            Link(destination: url) {
                Text("μμ½ λ¬Έμ")
            }
        }
    }
}
