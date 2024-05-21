//
//  AudioPlayListView.swift
//  MusicMantra
//
//  Created by Sumit on 11/05/24.
//

import SwiftUI

 struct AudioPlayListView: View {
    
     @ObservedObject var audioFileTracker:AudioFileTracker
     
    var body: some View {
    
        ZStack {
            GeometryReader { geometry in
             VStack {
                Image("backgroun4")
                     .resizable()
                     .frame(width: geometry.size.width, height: geometry.size.height/2 - 50)
                 TopHeaderView()
                     .padding([.top], -130)
                 TabViewRowsView()
                     .padding([.top],0)
                 AudioItemList(audioFileTracker: audioFileTracker)

                // Spacer()
             }
         }
      }.ignoresSafeArea()
       .background(.black)
    }
 }

//#Preview {
   // AudioPlayListView()
//}
