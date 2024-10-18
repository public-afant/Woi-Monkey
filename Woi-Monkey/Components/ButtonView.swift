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
                .font(.system(size: CGFloat(size)))
                .foregroundColor(.black).bold()
                .padding(.vertical, 15.0)
                        .frame(maxWidth: .infinity)
                        .background(backgroundColor)
                        .cornerRadius(8)
//                        .shadow(radius: 5).bold()
                }
//        Button{
//            
//        }label: {
//            Text("Next").frame(maxWidth: 300, maxHeight: 30).bold().font(.system(size: 1))
//        }.buttonStyle(.borderedProminent).tint(.primaryColor)
        
    }
}

#Preview {
    ButtonView(title: "title", backgroundColor: .primaryColor,size: 18, action: {})
}
