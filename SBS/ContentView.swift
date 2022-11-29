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
    @State var subTitle = "파인다이닝 레스토랑에 오신걸 환영합니다."
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
                    Text("12월 \(calculateFirst() ? 1 : 5)일 초대되는 귀한 분")
                        .font(.largeTitle)
                    
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
