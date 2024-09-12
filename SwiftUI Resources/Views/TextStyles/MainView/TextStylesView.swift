//
// 
// FileName: TextStylesView.swift
// ProjectName: SwiftUI Resources
//
// Created by MD ABIR HOSSAIN on 12/9/24 at 6:14 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct TextStylesView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                TextTypingView(fullText: "hey, This is Md Abir Hossain")
            }
        }
    }
}

// MARK: - Preview
struct TextStylesView_Previews: PreviewProvider {
    static var previews: some View {
        TextStylesView()
    }
}
