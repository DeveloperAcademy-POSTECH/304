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
    @State var isMuted = false
    let isFirst: Bool
    
    init() {
        let date = Date()
        let calendar = Calendar.current
        
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        
        isFirst = month == 11 || day < 2
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                CelebrationEffect()
                
                buttons
                    .ignoresSafeArea()
                
                VStack {
                    Image("304slogan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    Bounce(headTitle: $headTitle, subTitle: $subTitle)
                    
                    Divider()
                        .foregroundColor(.black)
                    
                    Text("12月 \(isFirst ? 1 : 5)日의 貴賓")
                        .font(.choSunGsTitle)
                    
                    emoji
                        .padding(.bottom, 32)
                    
                    quote
                        
                    
                    Spacer()
                    
                }
            }
            .padding()
            .onAppear {
                self.playSound(sound: "song", type: "mp3")
            }
        }
    }
    
    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                if let _ = audioPlayer {
                    return 
                }
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                print("ERROR: Could not find and play the sound file!")
            }
        }
    }
    
    @ViewBuilder
    var emoji: some View {
        if isFirst {
            HStack {
                VStack {
                    Image("daisy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("Daisy")
                }
                VStack {
                    Image("gommin")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("Gommin")
                }
            }
            .padding()
        } else {
            HStack {
                VStack {
                    Image("young")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("Young")
                }
                VStack {
                    Image("lingo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("Lingo")
                }
                VStack {
                    Image("vivi")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text("Vivi")
                }
            }
        }
    }
    
    @ViewBuilder
    var buttons: some View {
        VStack {
            Spacer()
            ZStack {
                HStack {
                    NavigationLink(destination: WayToCome(isFirst: isFirst)) {
                        VStack(alignment: .leading) {
                            Text("오시는 길")
                                .foregroundColor(.black)
                            Image(systemName: "map")
                                .foregroundColor(.black)
                        }
                    }
                    Spacer()
                }
                
                NavigationLink(destination: MenuView()) {
                    VStack(alignment: .center) {
                        Text("차림상")
                            .foregroundColor(.black)
                        Image(systemName: "book")
                            .foregroundColor(.black)
                    }
                }
                
                HStack {
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("소리")
                        Image(systemName: isMuted ? "speaker.slash" : "speaker.wave.3")
                    }
                    .onTapGesture {
                        if isMuted {
                            audioPlayer?.volume = 1
                        } else {
                            audioPlayer?.volume = 0
                        }
                        isMuted.toggle()
                    }
                }
            }
        }
    }
    
    var quote: some View {
        VStack {
            FadeInOutView(text: "떠나가는 한 해를 마무리하며..", startTime: 0.1)
                .padding(.bottom)
            
            FadeInOutView(text: "좋은 因緣이란 시작이 아닌 끝이 좋은 因緣입니다.", startTime: 2)
                .padding(.bottom, 4)
            
            FadeInOutView(text: "시작은 나와 상관없더라도 이를 어떻게 마무리하는가는", startTime: 5)
                .padding(.bottom, 4)
            
            FadeInOutView(text: "나 자신에게 달렸기 때문입니다.", startTime: 8)
                .padding(.bottom, 4)
            
    
            FadeInOutView(text: "오시는 시간 오후 \(isFirst ? "6시 반" : "6시")", startTime: 11)
                .padding(.top, 40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
