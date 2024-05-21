//
//  AudioFileTracker.swift
//  MusicMantra
//
//  Created by Sumit on 12/05/24.
//

  import Foundation
  import Combine



  class AudioFileTracker:ObservableObject {

     
      @Published var audioItemsList:[AudioItemsList] = []
      @Published var audioSelectItemsList:[AudioItemsList] = []
      
      
      init() {
          setUpAllAudioFileSystem()
      }
      
  }

extension AudioFileTracker {
    
    func setUpAllAudioFileSystem() {
        addAllFile(file: generatingAudioItemsListSystem(img: "AudioTwo", audioFileName: "Teri Baaton Mein Aisa Uljha Jiya",audioSubName:"Tum Se (Song): Shahid Kapoor, Kriti Sanon | Sachin-Jigar", audioFileURl: "File1",isAudioPaly:false))
        addAllFile(file: generatingAudioItemsListSystem(img: "AudioOne", audioFileName: "Mera Marz Tuhi",audioSubName:"Mera Marz Tuhi | Shraddha K. & Aditya R. K.", audioFileURl: "File2",isAudioPaly:false))
        addAllFile(file: generatingAudioItemsListSystem(img: "AudioThree", audioFileName: "Choli Ke Peeche",audioSubName:"Alka Yagnik · Ila Arun Choli Ke Peeche", audioFileURl: "File3",isAudioPaly:false))
     }

    private func generatingAudioItemsListSystem(img: String , audioFileName:String, audioSubName:String,audioFileURl:String,isAudioPaly:Bool)-> AudioItemsList { return AudioItemsList(img: img,audioFileName: audioFileName,audioSubName:audioSubName, audioFileURl: audioFileURl, isAudioPaly: isAudioPaly) }

      private func addAllFile(file:AudioItemsList) { audioItemsList.append(file) }

 }

 extension AudioFileTracker {
    
    func selectItemRowHit(_ index:Int) {
           let select_item = audioItemsList[index]
               audioSelectItemsList.removeAll()
               audioSelectItemsList.append(select_item)
   }
    
     
     func updatePayingAudio(_ isAudioPaly:Bool) {
                 var select_item = audioSelectItemsList[0]
                   select_item.isAudioPaly = isAudioPaly
                  audioSelectItemsList.removeAll()
                audioSelectItemsList.append(select_item)
    }

     var isAudioPaly:Bool {
         get { return audioSelectItemsList[0].isAudioPaly }
     }
     
    
 }


