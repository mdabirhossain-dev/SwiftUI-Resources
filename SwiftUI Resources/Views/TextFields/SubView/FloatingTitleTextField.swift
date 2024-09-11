//
// 
// FileName: FloatingTitleTextField.swift
// ProjectName: SwiftUI Resources
//
// Created by MD ABIR HOSSAIN on 11-09-2024 at 2:12 PM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct FloatingTitleTextField: View {
    // MARK: - Properties
    let title: String
    @Binding var text: String
    @FocusState var isTyping: Bool
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text)
                .padding(.leading)
                .frame(height: 55)
                .focused($isTyping)
                .background(isTyping ? .blue : .primary, in: RoundedRectangle(cornerRadius: 14)
                    .stroke(lineWidth: 2)
                )
            
            Text(title)
                .padding(.horizontal, 5)
                .background(Color.reversePrimary.opacity(isTyping || text.isNotEmpty ? 1 : 0))
                .foregroundStyle(isTyping ? .blue : Color.primary)
                .padding(.leading)
                .offset(y: isTyping || text.isNotEmpty ? -27 : 0)
                .onTapGesture {
                    isTyping.toggle()
                }
        }
        .animation(.linear(duration: 0.2), value: isTyping)
    }
}

struct FloatingTitleTextField_Previews: PreviewProvider {
    static var previews: some View {
        FloatingTitleTextField(title: "First Name", text: .constant(""))
    }
}
