//
//  TodoScreen.swift
//  Woi-Monkey
//
//  Created by YH on 10/15/24.
//

import SwiftUI

struct TodoView: View {
    
    @Binding var path: [String]
    @Binding var title: String
    @FocusState private var titleFieldIsFocused: Bool
    
    let maxCharacters: Int = 38
    let maxNewLines = 1 // 허용되는 최대 줄바꿈 수 (1줄)
    @State private var isOverLimit: Bool = false// 글자 초과 여부를 추적하는 상태
    
    
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
                    text: $title,
                    axis: .vertical
                ).font(.customFont18)
                    .focused($titleFieldIsFocused)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(.horizontal, 5)
                    .lineLimit(1...3)
                    .frame(height: 40)
                    .onChange(of: title){ oldValue, newValue in
                        if newValue.count >= maxCharacters {
                            title = String(newValue.prefix(maxCharacters))
                            isOverLimit = true
                        }
                        else {
                            isOverLimit = false
                        }
                    }
                
                
                RoundedRectangle(cornerRadius: 10).frame(height: 3).foregroundStyle(title.isEmpty ? .primaryOrange.opacity(0.4) : .primaryOrange).padding(.horizontal,5)
                
                // 문자 수 카운트
                Text("입력된 문자 수: \(title.count)/\(maxCharacters)")
                    .foregroundColor(isOverLimit ? .primaryOrange : .gray) // 초과 시 빨간색
                    .padding(.top, 5)
                    .padding(.leading, 5)

                
                // 경고 메시지
//                if isOverLimit {
//                    Text("38 글자를 초과할 수 없습니다.")
//                        .foregroundColor(.red) // 빨간 글씨로 경고 메시지 표시
//                        .padding(.top, 3)
//                        .padding(.leading, 5)
//                        .fontWeight(.semibold)
//                }
                
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
        }.navigationBarItems(leading: BackButton(path: $path))
        
    }
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


#Preview {
    TodoView(path: .constant([]), title: .constant(""))
}
