//
//  StopWatchButton.swift
//  stopwatch
//
//  Created by Kevin ABRIOUX on 20/08/2019.
//  Copyright © 2019 Kevin ABRIOUX. All rights reserved.
//

import SwiftUI

struct StopWatchButton: View {
    var actions: [() -> Void]
    var labels: [String]
    var color: Color
    var isPaused: Bool
    
    var body: some View {
        return Button(action: {
            self.isPaused ? self.actions[0]() : self.actions[1]()
        }, label: { () -> Text in
            Text((self.isPaused ? self.labels[0] : self.labels[1]))
                .foregroundColor(Color.white)
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .center)
        .background(self.color)
    }
}

#if DEBUG
struct StopWatchButton_Previews: PreviewProvider {
    static var previews: some View {
        StopWatchButton(
        actions: [],
        labels: ["mock","mock"],
        color: Color.red,
        isPaused: true)
    }
}
#endif
