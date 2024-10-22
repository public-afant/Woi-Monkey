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
            VStack{
                HStack{
                    Image("monkey_head_1x").resizable().frame(width: 45, height: 40)
                    if let data = context.state.time {
                        Text(data,style: .timer).font(.system(size: 40)).fontWeight(.semibold).padding(.leading, 10.0).foregroundStyle(Color("orange"))
                    }else {
                        Text("")
                    }
                    Spacer()
                    Image(systemName: "stop.circle").font(.system(size: 40)).foregroundStyle(Color("orange"))
                }
                .padding(.horizontal, 20.0)
                .padding(.bottom, 10.0)
                VStack(alignment: .center){
                    Text(context.state.title.split(separator: "")
                        .joined(separator: "\u{200B}")).foregroundStyle(Color("orange"))
                        .lineLimit(nil) // 줄 수 제한 없이 자동 줄바꿈
                        .fixedSize(horizontal: false, vertical: true) // 세로로 크기 고정되지 않도록 설정
                        .multilineTextAlignment(.center) // 가운데 정렬
                        .layoutPriority(1) // 공간 우선 차지
                }.padding(.horizontal, 20.0).font(.system(size: 18)).fontWeight(.semibold).lineSpacing(5)
                
            }.frame(maxWidth: .infinity).frame(height: 200).activityBackgroundTint(Color("iconcolor").opacity(0.7))
                .activitySystemActionForegroundColor(Color.red)
    
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    VStack{
                        HStack{
                            Image("monkey_head_1x").resizable().frame(width: 45, height: 40)
                            if let data = context.state.time {
                                Text(data,style: .timer).font(.system(size: 40)).fontWeight(.semibold).padding(.leading, 10.0).foregroundStyle(Color("orange"))
                            }else {
                                Text("")
                            }
                            Spacer()
                            Image(systemName: "stop.circle").font(.system(size: 40)).foregroundStyle(Color("orange"))
                        }
                        .padding(.horizontal, 10.0)
                        .padding(.bottom, 10.0)
                        VStack(alignment: .center){
                            Text(context.state.title.split(separator: "")
                                .joined(separator: "\u{200B}")).foregroundStyle(Color("orange"))
                                .lineLimit(nil) // 줄 수 제한 없이 자동 줄바꿈
                                .fixedSize(horizontal: false, vertical: true) // 세로로 크기 고정되지 않도록 설정
                                .multilineTextAlignment(.center) // 가운데 정렬
                                .layoutPriority(1) // 공간 우선 차지
                        }.padding(.horizontal, 20.0).font(.system(size: 18)).fontWeight(.semibold).lineSpacing(5)
                        
                    }.frame(maxWidth: .infinity).frame(height: 105)
                }
            } compactLeading: {
                Image("monkey_head_1x").resizable().frame(width: 23,height: 20)

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
        DynamicIslandWidgetAttributes.ContentState(time: .now, title: "두줄로나왔을때몇글자까지나오는지확인좀해봅시다람확인해보자확인몇자까지가능한")
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
