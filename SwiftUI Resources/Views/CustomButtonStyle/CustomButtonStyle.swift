//
// 
// FileName: CustomButtonStyle.swift
// ProjectName: SwiftUI Resources
//
// Created by MD ABIR HOSSAIN on 29-08-2024 at 12:34 AM
// Website: https://mdabirhossain.com/
//


import SwiftUI

// MARK: - Neumorphic Button Style
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

// MARK: - Pressable Button Style
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


// MARK: - Loading Button Style
struct LoadingButtonStyle: View {
    // MARK: - Properties
    @State var spin = false
    @State var isPressed = false
    @State var next: CGFloat = 73
    @State var hasBeenPressed = false
    let startTitle: String
    let endTitle: String
    @Binding var reset: Bool
    let action: () -> Void
    
    // MARK: - Body
    var body: some View {
        TextAnimation(startTitle: startTitle, endTitle: endTitle, next: $next, spin: $spin)
            .frame(width: 300, height: 60)
            .clipped()
            .background(.primary, in: .rect(cornerRadius: 12))
            .scaleEffect(isPressed ? 1.1 : 1)
            .animation(.spring, value: isPressed)
            .animation(.spring(duration: 1), value: next)
            .gesture(dragGesture())
    }
    
    func dragGesture() -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in
                isPressed = true
            }
            .onEnded { _ in
                action()
                isPressed = false
                if !hasBeenPressed {
                    hasBeenPressed = true
                    withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                        spin = true
                    }
                    next -= 73
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        next -= 73
                    }
                }
            }
    }
}

struct TextAnimation: View {
    // MARK: - Properties
    var startTitle: String
    var endTitle: String
    @Binding var next: CGFloat
    @Binding var spin: Bool
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 50) {
            Text(endTitle)
            
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(lineWidth: 3)
                .frame(width: 25, height: 25)
                .rotationEffect(.degrees(spin ? 360 : 0))
            
            Text(startTitle)
        }
        .bold()
        .foregroundStyle(.gray)
        .offset(y: -next)
    }
}
