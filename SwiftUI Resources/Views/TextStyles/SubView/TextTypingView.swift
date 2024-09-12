//
// 
// FileName: TextTypingView.swift
// ProjectName: SwiftUI Resources
//
// Created by MD ABIR HOSSAIN on 12/9/24 at 6:00 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct TextTypingView: View {
    // MARK: - Properties
    @State private var displayedText = ""
    var fullText: String
    let typingSpeed = 0.15
    @State private var showLine = false
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text(displayedText)
                .font(.largeTitle.bold())
            
            Rectangle()
                .frame(width: 5, height: 40)
                .opacity(showLine ? 1 : 0)
        }
        .foregroundStyle(.red)
        .onAppear(perform: {
            withAnimation(.linear(duration: 0.5).repeatForever(autoreverses: false)) {
                showLine.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                startTyping()
            }
        })
    }
    
    func startTyping() {
        displayedText = ""
        for (index, character) in fullText.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + typingSpeed * Double(index)) {
                displayedText.append(character)
                if index == fullText.count - 1 {
                    showLine = false
                } else {
                    showLine.toggle()
                }
            }
        }
    }
}

// MARK: - Preview
struct TextTypingView_Previews: PreviewProvider {
    static var previews: some View {
        TextTypingView(fullText: "Hello Broo")
    }
}
