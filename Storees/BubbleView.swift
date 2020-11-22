//
//  BubbleView.swift
//  Storees
//
//  Created by João Gabriel Pozzobon dos Santos on 21/11/20.
//

import SwiftUI

struct BubbleView: View {
    let image: Image
    let username: String
    let seen: Bool
    
    let animation: Namespace.ID
    
    let onTap: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Button(action: onTap) {
                ZStack {
                    Circle()
                        .strokeBorder(LinearGradient(gradient: Gradient(colors: seen ? [.gray] : [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 3)
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .padding(6)
                        .matchedGeometryEffect(id: username+"-image", in: animation)
                }
            }.buttonStyle(BubbleButtonStyle())
            .padding(4)
            Text(username)
                .font(.system(size: 12, weight: .bold))
                .matchedGeometryEffect(id: username+"-username", in: animation)
        }.padding(4)
    }
    
    struct BubbleButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .accentColor(.black)
                .scaleEffect(configuration.isPressed ? 0.85 : 1.0)
                .animation(.spring(response: 0.25, dampingFraction: 0.725))
        }
    }
}
