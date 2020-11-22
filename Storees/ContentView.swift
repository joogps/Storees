//
//  ContentView.swift
//  Storees
//
//  Created by João Gabriel Pozzobon dos Santos on 20/11/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appData: AppData
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var presentingStory = false
    @State var selectedStory: Int?
    
    @Namespace private var animation
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    logo.scaledToFit()
                    Spacer()
                    Button(action: {
                    }) {
                        Image(systemName: "info.circle")
                            .font(.system(size: 22, weight: .medium))
                    }
                }.frame(height: 30)
                .padding(.horizontal, 16)
                .padding(.top, 12)
                .padding(.bottom, 4)
                
                ScrollView {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack (spacing: 0) {
                            ForEach(appData.stories.indices) { index in
                                let story = appData.stories[index]
                                BubbleView(image: story.userImage,
                                           username: story.username,
                                           seen: story.lastUnseen == nil,
                                           animation: animation,
                                           onTap: {
                                                withAnimation(.spring(response: 0.3, dampingFraction: 1)) {
                                                    presentingStory = true
                                                    selectedStory = index
                                                }
                                           }
                                )
                            }
                        }.padding(.leading, 6)
                    }.frame(height: 100)
                }
            }
            
            if presentingStory && selectedStory != nil {
                StoryView(selectedStory: selectedStory!, isPresented: $presentingStory, animation: animation)
            }
        }.accentColor(.primary)
    }
    
    @ViewBuilder
    var logo: some View {
        if colorScheme == .dark {
            Image("Logo")
                .resizable()
                .colorInvert()
        } else {
            Image("Logo")
                .resizable()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppData())
    }
}
