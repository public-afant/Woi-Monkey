//
//  DynamicIslandWidgetLiveActivity.swift
//  DynamicIslandWidget
//
//  Created by YH on 10/19/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct DynamicIslandWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var time: Date?
        var title: String
        
    }
    
    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct DynamicIslandWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: DynamicIslandWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            
            HStack(alignment: .center) {
                Image("monkey_head_1x").resizable().frame(width: 55, height: 50).padding()
                VStack(alignment: .leading) {
                    if let data = context.state.time {
                        Text(data,style: .timer).font(.system(size: 24)).fontWeight(.semibold).foregroundStyle(Color("orange"))
                    }else {
                        Text("")
                    }
                    Text(context.state.title).foregroundStyle(Color("orange"))
                    
                }
                Spacer()
                Image(systemName: "stop.circle").padding(.trailing,20.0).font(.system(size: 50)).foregroundStyle(Color("orange"))
                
            }
            .activityBackgroundTint(Color("iconcolor").opacity(0.7))
            .activitySystemActionForegroundColor(Color.red)
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    //                    Image()
                }
                DynamicIslandExpandedRegion(.trailing) {
                    //                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    //                    Text("Bottom \(context.state.title)")
                    HStack{
                        Image("monkey_head_1x").resizable().frame(width: 55, height: 50).padding()
                        VStack(alignment: .leading) {
                            //                            Text(context.state.time, style: .timer).font(.system(size: 20)).fontWeight(.bold)
                            if let data = context.state.time {
                                Text(data,style: .timer).font(.system(size: 20)).fontWeight(.bold).foregroundStyle(Color("orange"))
                            }else {
                                Text("")
                            }
                            Text(context.state.title).foregroundStyle(Color("orange"))
                        }
                        Spacer()
                        Image(systemName: "stop.circle").padding(.trailing,20.0).font(.system(size: 50)).foregroundStyle(Color("orange"))
                    }
                    // more content
                }
            } compactLeading: {
                Image("icon_key_2").resizable().frame(width: 20,height: 20)
            } compactTrailing: {
                if let data = context.state.time {
                    Text(data,style: .timer)
                    .foregroundStyle(Color("orange")).font(.system(.body, design: .monospaced)) // 고정폭 폰트 사용
                    .truncationMode(.tail) // 잘리지 않도록 설정
                    .frame(maxWidth: 40, alignment: .trailing) // 최대 너비 안에서 오른쪽 정렬
                    .fixedSize(horizontal: true, vertical: false)
                }else {
                    Text("")
                }
            } minimal: {
                Image("monkey_head_1x").resizable().frame(width: 20,height: 18)
            }
            .keylineTint(Color.red)
        }
    }
}

extension DynamicIslandWidgetAttributes {
    fileprivate static var preview: DynamicIslandWidgetAttributes {
        DynamicIslandWidgetAttributes(name: "World")
    }
}

extension DynamicIslandWidgetAttributes.ContentState {
    fileprivate static var smiley: DynamicIslandWidgetAttributes.ContentState {
        DynamicIslandWidgetAttributes.ContentState(time: .now, title: "😀")
    }
    
    fileprivate static var starEyes: DynamicIslandWidgetAttributes.ContentState {
        DynamicIslandWidgetAttributes.ContentState(time: .now, title: "🤩")
    }
}

#Preview("Notification", as: .content, using: DynamicIslandWidgetAttributes.preview) {
    DynamicIslandWidgetLiveActivity()
} contentStates: {
    DynamicIslandWidgetAttributes.ContentState.smiley
    DynamicIslandWidgetAttributes.ContentState.starEyes
}
