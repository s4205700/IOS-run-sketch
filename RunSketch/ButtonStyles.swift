//
//  ButtonStyles.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 5/8/2026.
//
//  ButtonStyles.swift
//  RunSketch
//
//  Created by Satvik Kharbanda on 5/8/2026.
//

import SwiftUI


struct MainButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(
                RoundedRectangle(cornerRadius: 15)
            )
            .scaleEffect(
                configuration.isPressed ? 0.96 : 1
            )
    }
}


struct SecondaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.red.opacity(0.85))
            .foregroundStyle(.white)
            .clipShape(
                RoundedRectangle(cornerRadius: 15)
            )
            .scaleEffect(
                configuration.isPressed ? 0.96 : 1
            )
    }
}
