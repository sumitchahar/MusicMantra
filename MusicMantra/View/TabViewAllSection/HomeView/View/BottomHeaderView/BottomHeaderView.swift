//
//  BottomHeaderView.swift
//  MusicMantra
//
//  Created by Sumit on 13/05/24.
//

import SwiftUI

struct BottomHeaderView: View {
    
    @State var height:CGFloat = UIScreen.main.bounds.height
    @State var istabSelect:Bool = false
    @State var isPlay:Bool = false
    @State var isOverlay:Bool = false
    @State  var isShowingDetailView = false

    @ObservedObject var audioFileTracker:AudioFileTracker
    
    var body: some View {
           ZStack(alignment: .bottom) {
               VStack {
                   Spacer()
                   HStack {
                      Image(audioFileTracker.audioSelectItemsList.first?.img ?? "")
                           .resizable()
                           .aspectRatio(contentMode: .fill)
                           .frame(width:45,height: 45)
                           .cornerRadius(5)
                           .padding([.leading,.top,.bottom])
                       VStack(alignment:.leading, spacing: 4) {
                           Text($audioFileTracker.audioSelectItemsList.first?.audioFileName.wrappedValue ?? "")
                               .font(.system(size: 18, weight: .bold, design: .default))
                               .foregroundStyle(.white)
                               .lineLimit(1)
                            Text($audioFileTracker.audioSelectItemsList.first?.audioSubName.wrappedValue ?? "")
                               .font(.system(size: 17, weight: .medium, design: .default))
                               .foregroundStyle(.gray)
                               .lineLimit(1)
                     }.padding([.leading],8)
                      .frame(width:UIScreen.main.bounds.width/1.7,alignment: .leading)

                     HStack {
                         Spacer()
                         
                    Button {
                        if !audioFileTracker.audioSelectItemsList.first!.isAudioPaly {
                            audioFileTracker.updatePayingAudio(true)
                            AudioPlayer.share.playSound(sound: audioFileTracker.audioSelectItemsList.first?.audioFileURl ?? "", type: "mp3")
                             AudioPlayer.share.playbufferAudio()
                        } else {
                               audioFileTracker.updatePayingAudio(false)
                               AudioPlayer.share.pause()
                            }
                                                
                        } label: {
                               Image(systemName: audioFileTracker.isAudioPaly == true ? "pause.fill" : "play.fill" )
                                   .resizable()
                                   .foregroundColor(.white)
                                   .frame(width:24,height: 24)
                           }
                       }.padding([.trailing], 20)
                       
                   }.background(Color.init(red: 28.0/255.0, green: 31.0/255.0, blue: 37.0/255.0))
                       .padding([.bottom], 48)
                       .onTapGesture {
                           isShowingDetailView = true
                           AudioPlayer.share.pause()
                           audioFileTracker.updatePayingAudio(false)
                       }
               }.fullScreenCover(isPresented: $isShowingDetailView) {
                   AudioPlayFullScreen(audioFileTracker: audioFileTracker)
               }
           }
    }
    
 }

 #Preview {
    BottomHeaderView(audioFileTracker: AudioFileTracker())
 }
