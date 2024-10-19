//
//  ButtonView.swift
//  Woi-Monkey
//
//  Created by YH on 10/15/24.
//

import SwiftUI



struct ButtonView: View {
    let title: String
    let backgroundColor: Color
    let size: Int
    let action: () -> Void
    
    
    var body: some View {
        
        Button(action: action) {
            Text(title)
                .font(Font.custom("DungGeunMo", size: CGFloat(size)))
                .foregroundColor(.black).bold()
                .padding(.vertical, 15.0)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(backgroundColor)
                .cornerRadius(8)
        }
    }
}

#Preview {
    ButtonView(title: "안녕하세요", backgroundColor: .primaryColor,size: 18, action: {})
}
