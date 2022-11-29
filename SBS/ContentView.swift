//
//  ContentView.swift
//  SBS
//
//  Created by Inho Choi on 2022/11/30.
//

import AVFoundation
import SwiftUI

struct ContentView: View {
    @State var headTitle = "어서오십시요 304 입니다."
    @State var subTitle = "파인다이닝 레스토랑에 오신 것을 환영합니다."
    @State var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        ZStack {
            CelebrationEffect()
            
            VStack {
                Image("304slogan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Bounce(headTitle: $headTitle, subTitle: $subTitle)
                
                ScrollView {
                    Text("12月 \(calculateFirst() ? 1 : 5)日의 貴賓")
                        .customFontSetting()
                    
                    if calculateFirst() {
                        HStack {
                            Image("daisy")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Image("gommin")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .padding()
                    } else {
                        HStack {
                            Image("young")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Image("lingo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Image("vivi")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    
                }
                Text("떠나가는 한 해를 마무리하며..")
                    .customFontSmall()
                    .padding(.bottom)
                Text("좋은 因緣이란 시작이 아닌 끝이 좋은 因緣입니다.\n시작은 나와 상관없더라도 이를 어떻게 마무리하는가는\n나 자신에게 달렸기 때문입니다.")
                    .customFontSmall()
                    .multilineTextAlignment(.center)
                Spacer()
            }
        }
        .padding()
        .onAppear {
            self.playSound(sound: "song", type: "mp3")
        }
    }
    
    func calculateFirst() -> Bool {
        let date = Date()
        let calendar = Calendar.current
        
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        
        return month == 11 || day < 2
    }
    
    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                print("ERROR: Could not find and play the sound file!")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
