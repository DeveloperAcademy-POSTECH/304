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
                    
                    ScrollView {
                        Text("12月 \(isFirst ? 1 : 5)日의 貴賓")
                            .font(.choSunGsTitle)
                        
                        emoji
                        
                        quote
                        
                        
                        // TODO: 연호야 일어나서 여기다가 메뉴판 만들어다오.
                        // 참고사항 서드파티 많이 넣어놔서 에러 검출이 힘들다. 하나 만들고 빌드 하나 만들고 빌드 이런 형식으로 해야함
                    }
                    
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
            HStack {
                NavigationLink(destination: WayToCome()) {
                    Image(systemName: "map")
                        .foregroundColor(.black)
                }

                Spacer()
                Image(systemName: isMuted ? "speaker.slash" : "speaker.wave.3")
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
