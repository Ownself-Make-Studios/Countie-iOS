//
//  CircularEmojiView.swift
//  countie
//
//  Created by Nabil Ridhwan on 23/7/25.
//

import SwiftUI

struct CircularEmojiView: View {
    var emoji: String = "🎉" // Default emoji
    var progress: Float = 0.8 // Default progress value
    
    var body: some View {
        Circle()
            .frame(width: 34)
            .foregroundStyle(Color(vibrantDominantColorOf: emoji) ?? .gray.opacity(0.3))
            .overlay {
                Text("\(emoji)")
                CircularProgressBar(
                    progress: progress,
                    color: Color(vibrantDominantColorOf: emoji) ?? .gray.opacity(0.3))
                .frame(width: 44, height: 44)
            }
        
    }
}

#Preview {
    CircularEmojiView()
}
