//
//  TabViewRowsView.swift
//  MusicMantra
//
//  Created by Sumit on 12/05/24.
//

import SwiftUI

struct TabViewRowsView: View {
   
    @State var buttonTabId:Int = 0
    @State var buttonTablineColor:Color = .black

    var body: some View {
        
        HStack {
             Button {
                 buttonTabId = 1
                 buttonTablineColor = .red
                 print("Image tapped!")
             } label: {
                 VStack{
                 Text("Popular")
                    .foregroundStyle(.white)
                    .bold()
                 Rectangle()
                        .fill(buttonTabId == 1 ? buttonTablineColor : .black)
                    .frame(width:30, height:4)
                    .cornerRadius(4)
                    .padding([.top],-10)
                 }
                 .onAppear(perform: {
                    buttonTablineColor = .red
                    buttonTabId = 1
                })
            }

         Spacer()
            Button {
                buttonTabId = 2
                buttonTablineColor = .red
                print("Image tapped!111")
            } label: {
               VStack {
                Text("Albums")
                   .foregroundStyle(.white)
                   .bold()
                   Rectangle()
                       .fill(buttonTabId == 2 ? buttonTablineColor : .black)
                      .frame(width:30, height:4)
                      .cornerRadius(4)
                      .padding([.top],-10)
                }
            }

       Spacer()
            
          Button {
              buttonTabId = 3
              buttonTablineColor = .red
         } label: {
            VStack {
            Text("About")
               .foregroundStyle(.white)
               .bold()
            Rectangle()
                    .fill(buttonTabId == 3 ? buttonTablineColor : .black)
               .frame(width:30, height:4)
              .cornerRadius(4)
              .padding([.top],-10)
         }
      }
   } .frame(height:40)
     .padding([.leading,.trailing])
     .background(.black)

    }
    
}

#Preview {
    TabViewRowsView()
}
