//
//  AudioPlayFullScreen.swift
//  MusicMantra
//
//  Created by Sumit on 12/05/24.
//

 import SwiftUI


 struct AudioPlayFullScreen: View {
    
    @Environment(\.dismiss) var dismiss

    @State private var celsius: Double = 0
    @State private var audio: Bool = false

    @State private var starting_time:String = "1:12"
    @State private var ending_time:String = "3:00"

     @ObservedObject var audioFileTracker:AudioFileTracker

    
    var body: some View {
        
     NavigationView {
       ZStack {
         GeometryReader { geometry in
           VStack {
               Image(audioFileTracker.audioSelectItemsList.first?.img ?? "backgroun4")
                   .resizable()
                   .scaleEffect(1.2)
                   .aspectRatio(1, contentMode: .fit)
                    .frame(width: geometry.size.width, height: geometry.size.height/1.6 - 50)
                      
                Spacer()
                    
             HStack {
               VStack(alignment:.leading,spacing: 5) {
                   Text(audioFileTracker.audioSelectItemsList.first?.audioFileName ?? "I Like you (A Happier Song) ")
                             .foregroundStyle(.white)
                             .font(.system(size: 24, weight: .bold, design: .default))
                   Text(audioFileTracker.audioSelectItemsList.first?.audioSubName ?? "Post Malone, Doja Cat ")
                             .foregroundStyle(.gray)
                             .font(.system(size: 19, weight: .semibold, design: .default))
                  HStack {
                      VStack {
                         Slider(value: $celsius, in: -90...110)
                               .accentColor(.red)
                         HStack{
                            Text(starting_time)
                                 .foregroundStyle(.gray)
                                 .font(.system(size: 15, weight: .bold, design: .default))
                               Spacer()
                            Text(ending_time)
                                 .foregroundStyle(.gray)
                                 .font(.system(size: 15, weight: .bold, design: .default))
                         }.padding([.top],-10)
                     }.padding([.top],4)
             }
                             
              VStack(spacing:50) {
                    HStack {
                        Image(systemName: audio == true ? AudioPlayFullScreenEnum.RepeatIcon.text : AudioPlayFullScreenEnum.RepeatIcon.text)
                                       .resizable()
                                       .foregroundColor(.white)
                                       .frame(width:22,height: 24)
                            Spacer()
                        
                        Image(systemName: audio == true ? AudioPlayFullScreenEnum.Backward_end.text : AudioPlayFullScreenEnum.Backward_end.text )
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width:22,height: 24)
                                
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
                           
                        
//                        Image(systemName: audio == true ? AudioPlayFullScreenEnum.Pause_fill.text : AudioPlayFullScreenEnum.Play_fill.text )
//                                        .resizable()
//                                        .foregroundColor(.white)
//                                        .frame(width:24,height: 24)

                             Spacer()
                        
                        Image(systemName: audio == true ? AudioPlayFullScreenEnum.Forward_end.text : AudioPlayFullScreenEnum.Forward_end.text )
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width:22,height: 24)

                              Spacer()
                                
                        Image(systemName: audio == true ? AudioPlayFullScreenEnum.Point_forward_to_Point_capsulepath.text : AudioPlayFullScreenEnum.Point_forward_to_Point_capsulepath.text)
                                           .resizable()
                                           .foregroundColor(.white)
                                           .frame(width:22,height: 22)
                               }.padding([.trailing])
                            
                    HStack {
                        Image(systemName: audio == true ? AudioPlayFullScreenEnum.Heart_fill.text : AudioPlayFullScreenEnum.Heart_fill.text )
                                              .resizable()
                                              .foregroundColor(.gray)
                                              .frame(width:20,height: 20)
                                              .padding([.trailing])

                        Image(systemName: audio == true ?     AudioPlayFullScreenEnum.Arrowshape_down_fill.text :    AudioPlayFullScreenEnum.Arrowshape_down_fill.text)
                                              .resizable()
                                              .foregroundColor(.gray)
                                              .frame(width:20,height: 20)
                                
                                Spacer()
                                Spacer()

                        Image(systemName: audio == true ? AudioPlayFullScreenEnum.Arrowshape_turn_up_forward_fill.text : AudioPlayFullScreenEnum.Arrowshape_turn_up_forward_fill.text )
                                            .resizable()
                                            .foregroundColor(.gray)
                                            .frame(width:22,height: 22)

                         Image(systemName: audio == true ? AudioPlayFullScreenEnum.Music_note_list.text : AudioPlayFullScreenEnum.Music_note_list.text)
                                           .resizable()
                                           .foregroundColor(.gray)
                                           .frame(width:22,height: 22)
                                           .padding([.leading])
                                
                            }.padding([.trailing])

                        }.padding([.top],45)
                   }
                        
                }.padding([.leading,.bottom])
                    
                  HStack {
                     VStack(alignment:.center) {
                         Image(systemName: audio == true ? AudioPlayFullScreenEnum.Chevron_up.text : AudioPlayFullScreenEnum.Chevron_up.text)
                                   .resizable()
                                   .foregroundColor(.white)
                                   .frame(width:14,height: 9)
                            
                        Text("Lyrics")
                                  .foregroundStyle(.white)
                   }
                }.padding()
            }
         }
      }.ignoresSafeArea()
            .background(.black)
            .toolbar {
             ToolbarItem(placement: .topBarLeading) {
                 Button(action: { 
                     AudioPlayer.share.pause()
                     audioFileTracker.updatePayingAudio(false)
                     dismiss()
                 })
                 { Image(systemName: AudioPlayFullScreenEnum.Arrow_backward.text)
                        .foregroundStyle(.white)
                      }
               }
               
             ToolbarItem(placement: .principal) {
                        Text("Playing Now")
                       .foregroundStyle(.white)
               }
               
              ToolbarItem(placement: .topBarTrailing) {
                      Button(action: { })
                  { Image(systemName: AudioPlayFullScreenEnum.Ellipsis.text)
                      .rotationEffect(.degrees(-90))
                      .tint(.white)
              }
           }
        }
     }.navigationBarBackButtonHidden()
        
    }
 }

#Preview { AudioPlayFullScreen(audioFileTracker: AudioFileTracker()) }

