//
//  AudioItemList.swift
//  MusicMantra
//
//  Created by Sumit on 12/05/24.
//

import SwiftUI

struct AudioItemList: View {
  
  @ObservedObject var audioFileTracker:AudioFileTracker
  @State private var selection: String?
    
  var body: some View {
      VStack {
        List {
            ForEach(audioFileTracker.audioItemsList.indices, id: \.self) { index in
              HStack {
                  Image(audioFileTracker.audioItemsList[index].img)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:56,height: 60)
                        .cornerRadius(5)
                   VStack(alignment:.leading, spacing: 4) {
                       Text(audioFileTracker.audioItemsList[index].audioFileName)
                              .font(.system(size: 16, weight: .medium, design: .default))
                              .foregroundStyle(.white)
                       Text(audioFileTracker.audioItemsList[index].audioSubName)
                              .font(.system(size: 16, weight: .medium, design: .default))
                              .foregroundStyle(.gray)
                              .lineLimit(2)
                   }.padding([.leading],8)
                   .frame(width:UIScreen.main.bounds.width/1.5,alignment: .leading)
                  HStack {
                      Spacer()
                      Image("dot_menu")
                             .resizable()
                             .aspectRatio(contentMode: .fill)
                             .frame(width:0,height: 26)
                  }
                        Spacer()
                }.onTapGesture {
                    audioFileTracker.selectItemRowHit(index)
                    AudioPlayer.share.pause()
                    //audioFileTracker.updatePayingAudio(false)
                 }
                .tag(index)
                }
                .listRowBackground(Color.black)

        }
            .listStyle(.plain)
      }
        
    }
    
 }

#Preview {
    AudioItemList(audioFileTracker: AudioFileTracker())
}
