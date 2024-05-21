//
//  TopHeaderView.swift
//  MusicMantra
//
//  Created by Sumit on 12/05/24.
//

import SwiftUI

struct TopHeaderView: View {
    
    var body: some View {
        
        VStack(spacing:4) {
            
            Text("Post Malone")
                .foregroundStyle(.white)
                .font(.system(size: 29, weight: .bold, design: .default))
            
            Text("711,149 Followers")
                .foregroundStyle(.gray)
                .font(.system(size: 16, weight: .semibold, design: .default))
            
            HStack(spacing:62) {
                
                Button {
                    print("Image tapped!")
                } label: {
                    Text("FOLLOW")
                        .font(.system(size: 14, weight: .bold, design: .default))
                        .foregroundStyle(.white)
                        .background(Rectangle()
                        .fill(.red)
                        .cornerRadius(20)
                        .frame(width: 100,height: 30)
                     )
                }
                
                Button {
                    print("Image tapped!")
                } label: {
                    HStack {
                        Label("PLAY", systemImage: "play.fill")
                            .font(.system(size: 15, weight: .bold, design: .default))
                            .foregroundStyle(.black)
                            .background(Rectangle()
                                .fill(.white)
                                .cornerRadius(20)
                                .frame(width: 100,height: 30)
                        )
                    }
                }
            }.padding([.top],18)
        }
    }
    
}

#Preview {
    TopHeaderView()
}
