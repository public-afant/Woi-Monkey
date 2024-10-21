//
//  BackButton.swift
//  Woi-Monkey
//
//  Created by YH on 10/19/24.
//

import SwiftUI

struct BackButton: View {
    @Binding var path: [String]
    
    var body: some View {
        Button{
            path.removeLast()
        }label: {
            HStack(alignment: .center){
                Image(systemName: "chevron.left").aspectRatio(contentMode: .fit).foregroundStyle(Color(.primary)).font(.system(size: 15, weight: .semibold))
                
                Text("뒤로가기").font(.customFont18).padding(.bottom, 2).foregroundStyle(Color(.primary))
            }
        }
    }
}

#Preview {
    BackButton(path: .constant([]))
}
