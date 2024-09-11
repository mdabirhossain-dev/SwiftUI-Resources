//
// 
// FileName: CollapsibleSearchView.swift
// ProjectName: SwiftUI Resources
//
// Created by MD ABIR HOSSAIN on 11-09-2024 at 7:17 AM
// Website: https://mdabirhossain.com/
//


import SwiftUI

struct CollapsibleSearchView: View {
    // MARK: - Properties
    @State private var isShow = false
    @State private var text = ""
    @FocusState private var isTyping: Bool
    
    // MARK: - Body
    var body: some View {
        ZStack {
//            Color.grayBackground.opacity(0.5)
//                .ignoresSafeArea()
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: isShow ? 15 : 30)
                    .foregroundStyle(.thinMaterial)
                    .shadow(color: .black.opacity(0.1), radius: 0, x: 0, y: 6)
                
                HStack {
                    Image(systemName: isShow ? "xmark" : "magnifyingglass")
                        .font(.title2)
                        .foregroundStyle(.primary.opacity(0.5))
                        .contentTransition(.symbolEffect(.replace))
                        .onTapGesture {
                            withAnimation {
                                text = ""
                                isShow.toggle()
                                isTyping.toggle()
                            }
                        }
                    
                    TextField("Type here...", text: $text)
                        .focused($isTyping)
                        .opacity(isShow ? 1 : 0)
                }
                .padding(.leading)
            }
            .frame(width: isShow ? 300 : 50, height: 50)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 70)
            .clipped()
            .padding(.leading, 45)
            
        }
    }
}

struct CollapsibleSearchView_Previews: PreviewProvider {
    static var previews: some View {
        CollapsibleSearchView()
    }
}
