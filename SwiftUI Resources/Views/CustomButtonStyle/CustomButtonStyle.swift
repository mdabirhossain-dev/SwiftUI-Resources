//
// 
// FileName: CustomButtonStyle.swift
// ProjectName: SwiftUI Resources
//
// Created by MD ABIR HOSSAIN on 29-08-2024 at 12:34 AM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct NeumorphicButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(
                    Color.grayBackground
                        .shadow(.inner(color: Color.black.opacity(configuration.isPressed ? 0.15 : 0), radius: 10, x: 4, y: 4))
                        .shadow(.inner(color: Color.white.opacity(configuration.isPressed ? 1 : 0), radius: 10, x: -10, y: -10))
                )
            
            configuration.label.font(.title3)
                .opacity(configuration.isPressed ? 0.5 : 1)
        }
        .frame(width: 300, height: 60)
        .background(
            Color.grayBackground
                .shadow(.drop(color: Color.white.opacity(configuration.isPressed ? 0 : 1), radius: 10, x: 0, y: -10))
                .shadow(.drop(color: Color.black.opacity(configuration.isPressed ? 0 : 0.15), radius: 10, x: 15, y: 5))
            , in: .rect(cornerRadius: 12)
        )
        .animation(.none, value: configuration.isPressed)
    }
}

struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14)
                .frame(width: 306, height: configuration.isPressed ? 64 : 68)
                .foregroundColor(.black)
                .offset(y: configuration.isPressed ? 0.2 : 3)
            
            configuration.label.font(.title3).bold()
                .offset(y: configuration.isPressed ? -0.5 : 0)
                .foregroundColor(configuration.isPressed ? .white : .black)
                .frame(width: 300, height: 60)
                .background(configuration.isPressed ? .cyan : .pink.opacity(0.8), in: .rect(cornerRadius: 12))
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white)
                }
        }
        .animation(.spring, value: configuration.isPressed)
    }
}
