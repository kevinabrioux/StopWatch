//
//  ContentView.swift
//  stopwatch
//
//  Created by Kevin ABRIOUX on 19/08/2019.
//  Copyright © 2019 Kevin ABRIOUX. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var stopWatch : StopWatch
    
    init() {
        self.stopWatch = StopWatch()
    }
    
    var body: some View {
        VStack {
            Text(self.stopWatch.stopWatchTime)
            .font(.custom("courier", size: 70))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)

            HStack{
                Spacer()
                .frame(width: 20, height: nil, alignment: .center)
                StopWatchButton(
                    actions: [self.stopWatch.reset, self.stopWatch.lap],
                    labels: ["Reset", "Lap"],
                    color: Color.red,
                    isPaused: self.stopWatch.isPaused())
                StopWatchButton(
                    actions: [self.stopWatch.start, self.stopWatch.pause],
                    labels: ["Start", "Pause"],
                    color: Color.blue,
                    isPaused: self.stopWatch.isPaused())
                Spacer()
                    .frame(width: 20, height: nil, alignment: .center)
            }
            VStack(alignment: .leading) {
                Text("Laps")
                    .font(.title)
                    .padding()
                List {
                    ForEach(self.stopWatch.laps, id: \.uuid) { (lapItem)  in
                        Text(lapItem.stringTime)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            
            ContentView().previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            
            ContentView().previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .environment(\.sizeCategory, .extraSmall)
            
            ContentView().previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .environment(\.colorScheme, .dark)
        
        }
    }
}
#endif
