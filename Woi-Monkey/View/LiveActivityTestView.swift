//
//  LiveActivityTestView.swift
//  Woi-Monkey
//
//  Created by YH on 10/20/24.
//

import SwiftUI

struct LiveActivityTestView: View {
    
    @State private var isTrackingTime: Bool = false
    @State private var startTime: Date? = nil
    
    var body: some View {
        VStack{

            if let startTime {
                Text(startTime, style: .timer)
            }
            Button{
                isTrackingTime.toggle()
                
                if isTrackingTime {
                    startTime = .now
                }else{
                    startTime = nil
                }
            }label: {
                Text("Start")
            }
        }
    }
}

#Preview {
    LiveActivityTestView()
}
