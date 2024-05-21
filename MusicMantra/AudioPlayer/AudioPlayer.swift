//
//  AudioPlayer.swift
//  MusicMantra
//
//  Created by Sumit on 12/05/24.
//

import SwiftUI


import AVFoundation


class AudioPlayer  {

  static let share = AudioPlayer()
    
    var audioPlayer: AVAudioPlayer?

    
    var engine = AVAudioEngine()
    var playerNode = AVAudioPlayerNode()
    var mixerNode: AVAudioMixerNode?
    var audioFile: AVAudioFile?

    
    
    
    func playSound(sound: String, type: String) {
        
       /* engine.attach(playerNode)
        mixerNode = engine.mainMixerNode
        engine.connect(playerNode, to: mixerNode!, format: mixerNode!.outputFormat(forBus: 0))

        do {
            try engine.start()
        }

        catch let error {
            print("Error starting engine: \(error.localizedDescription)")
        }

        
        let url = Bundle.main.url(forResource: sound, withExtension: type)

        do {
            try audioFile = AVAudioFile(forReading: url!)
        }

        catch let error {
            print("Error opening audio file: \(error.localizedDescription)")
        }*/

        
        
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            } catch {
                print("ERROR")
            }
        }
        
      
        print(audioPlayer)
        
        print("@@@@@@@@@@@@")
        
        print(audioPlayer?.currentTime.description)

    }

    func playbufferAudio() {
        
        if audioPlayer?.isPlaying == false {
            audioPlayer?.play()
        } else {
            audioPlayer?.pause()
        }
        
        
//        engine.connect(playerNode, to: engine.mainMixerNode, format: audioFile?.processingFormat)
//        playerNode.scheduleFile(audioFile!, at: nil, completionHandler: nil)
//
//        
//        audioPlayer?.pause()
////        if playerNode.ti == .paused {
////            
////        }
//
//        if engine.isRunning{
//            playerNode.play()
//        } else {
//            print ("engine not running")
//        }

    }
    
    func pause() { audioPlayer?.pause() }

    
    func stop() { audioPlayer?.stop() }

}


//struct AudioPlayer: View {
//    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//    
//    
//}
//
//#Preview {
//    AudioPlayer()
//}









////
///
///
///
///




/*   ZStack(alignment: .bottom) {
       VStack {
           Spacer()
           HStack {
               Image("AudioOne")
                   .resizable()
                   .aspectRatio(contentMode: .fill)
                   .frame(width:45,height: 45)
                   .cornerRadius(5)
                   .padding([.leading,.top,.bottom])
               VStack(alignment:.leading, spacing: 4) {
                   Text("Mera Marz Tuhi")
                       .font(.system(size: 18, weight: .bold, design: .default))
                       .foregroundStyle(.white)
                   Text("Post Dynamic")
                       .font(.system(size: 17, weight: .medium, design: .default))
                       .foregroundStyle(.gray)
               }.padding([.leading],8)
               
               HStack {
                   Spacer()
                   
                   Button {
                       
                       if !isPlay {
                           isPlay = true
                           AudioPlayer.share.playSound(sound: "File1", type: "mp3")
                           
                           AudioPlayer.share.playbufferAudio()
                       } else {
                           isPlay = false
                           AudioPlayer.share.pause()
                       }
                   } label: {
                       Image(systemName: isPlay == true ? "pause.fill" : "play.fill" )
                           .resizable()
                           .foregroundColor(.white)
                           .frame(width:24,height: 24)
                   }
               }.padding([.trailing], 20)
               
           }.background(Color.init(red: 28.0/255.0, green: 31.0/255.0, blue: 37.0/255.0))
               .padding([.bottom], 48)
               .onTapGesture {
                   isShowingDetailView = true
               }
       }.fullScreenCover(isPresented: $isShowingDetailView, content: AudioPlayFullScreen.init)
   } */

