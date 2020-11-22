//
//  StoreesApp.swift
//  Storees
//
//  Created by João Gabriel Pozzobon dos Santos on 20/11/20.
//

import SwiftUI

@main
struct StoreesApp: App {
    var appData = AppData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appData)
        }
    }
}

class AppData: ObservableObject {
    @Published var stories: Array<Story> = [Story(username: "joogps", userImage: Image("Profile"), contents: [
        StoryContent(media: Image("Picture 1"), duration: 2, date: Date().addingTimeInterval(-5*60*60)),
        StoryContent(media: Image("Picture 2"), duration: 2.5, date: Date().addingTimeInterval(-4.5*60*60)),
        StoryContent(media: Image("Picture 3"), duration: 1, date: Date().addingTimeInterval(-3*60*60)),
        StoryContent(media: Image("Picture 4"), duration: 3.5, date: Date().addingTimeInterval(-2*60*60)),
        StoryContent(media: Image("Picture 5"), duration: 5, date: Date().addingTimeInterval(-37*60)),
        StoryContent(media: Image("Picture 6"), duration: 3, date: Date().addingTimeInterval(-16))
    ])]
}

struct Story {
    var username: String
    var userImage: Image
    var contents: [StoryContent]
    var lastUnseen: Int? {
        contents.firstIndex(where: { !$0.seen })
    }
}

struct StoryContent {
    var media: Image
    var duration: Double = 1.0
    var seen: Bool = false
    var date: Date = Date()
}
