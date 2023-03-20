//
//  LinkView.swift
//  SwiftUI Resources
//
//  Created by Md Abir Hossain on 20/3/23.
//

import SwiftUI

struct LinkView: View {
    var body: some View {
        VStack {
            
                // MARK: - URL (Will open in browser when tapped)
                // Without Design
            Link("My Portfolio (website)", destination: URL(string: "https://mdabirhossain.com/")!)
            
            
                // MARK: - Cell Number
                // Without Design
            Link("My Number (cell)", destination: URL(string: "tel:+8801521717367")!)
                .padding(10)
                .foregroundColor(Color.white)
                .background(Color.green)
                .cornerRadius(15)
            
            
                // MARK: - Email
                // Without Design
            Link("My e-main (personal)", destination: URL(string: "mailto:hossain.mdabir@gmail.com")!)
                .buttonStyle(.bordered)
            
            
            
                // MARK: - Custom Link View
                // With design
            Link(destination: URL(string: "https://mdabirhossain.com/")!) {
                
                HStack(spacing: 0) {
                    
                    Image(systemName: "person")
                        .foregroundColor(Color.white)
                    
                    Text("My Portfolio (Custom Design)")
                        .foregroundColor(Color.white)
                }
                .padding()
                .font(.system(size: 16, weight: .semibold))
                .background(Color.blue)
                .cornerRadius(15)
            }
        }
    }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView()
    }
}
