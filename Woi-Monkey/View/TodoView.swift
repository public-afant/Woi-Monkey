//
//  TodoScreen.swift
//  Woi-Monkey
//
//  Created by YH on 10/15/24.
//

import SwiftUI

struct TodoView: View {
    
    @State var title: String = ""
    @FocusState private var titleFieldIsFocused: Bool
    
    
    @Binding var path: [String]
    
    var body: some View {
        
        ZStack{
            Color.primaryWhite.ignoresSafeArea()
            
            VStack(alignment: .leading){
                Spacer().frame(height: 100)
                Text("해야할 일을 지금 바로 적어보세요!")
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .font(.customFont32)
                    .lineSpacing(12)
                
                Spacer().frame(height: 50)
                
                
                TextField(
                    "예시) 몽키를 물리치고 회사 일 끝내기!",
                    text: $title
                ).font(.customFont18)
                .focused($titleFieldIsFocused)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding(.horizontal, 5)
                Rectangle().frame(height: 3).foregroundStyle(title.isEmpty ? .primaryOrange.opacity(0.3) : .primaryOrange).padding(.horizontal,5)
                
                Spacer()
                
                //커스텀 컴포넌트 버튼
                ButtonView(title: "다 음", backgroundColor: title.isEmpty ? .primaryColor.opacity(0.3) : .primaryColor, size: 18, action: {
                                    path.append("SetTimerView")
                }).disabled(title.isEmpty)
                
                
            }.padding()
                .onTapGesture {
                    // 화면의 다른 부분을 터치하면 키보드를 숨김
                    hideKeyboard()
                }
        }
        
    }
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


#Preview {
    TodoView(path: .constant([]))
}
