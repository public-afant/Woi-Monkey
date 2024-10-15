//
//  TutorialScreen.swift
//  Woi-Monkey
//
//  Created by YH on 10/15/24.
//

import SwiftUI


struct TutorialScreen: View {
    var body: some View {
        NavigationStack{
            
            VStack{
                
                Text("Tutorial Screen")
                Text("Tutorial Screen")
                Text("Tutorial Screen")
                Text("Tutorial Screen")
                Text("Tutorial Screen")
                Text("Tutorial Screen")
                
                Spacer()
                Button{
                    
                    print("Handle Next!!")
                    
                }label: {
                    Text("Next").frame(maxWidth: 300, maxHeight: 30).bold().font(.system(size: 22))
                }.buttonStyle(.borderedProminent).tint(Color.purple)
                
            }
        }
    }
}


#Preview {
    TutorialScreen()
}
