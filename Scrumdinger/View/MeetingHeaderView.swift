//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Tayyip Güzel on 8.01.2025.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondElapsed: Int
    let secondRemaining: Int
    let theme: Theme
    
    private var totalSecond: Int {
        secondElapsed + secondRemaining
    }
    
    private var progress: Double {
        guard totalSecond > 0 else { return 1}
        return Double(secondElapsed) / Double(totalSecond)
    }
    
    private var minutesRemaining: Int {
        secondRemaining / 60
    }
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(PinkBorderedProgressViewStyle(accentColor: theme.accentColor, mainColor: theme.mainColor))
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondRemaining)", systemImage: "hourglass.tophalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
}

struct PinkBorderedProgressViewStyle: ProgressViewStyle {
    let accentColor: Color
    let mainColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .tint(mainColor)
            .padding(6)
            .border(accentColor, width: 5)
            .cornerRadius(4)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MeetingHeaderView(secondElapsed: 60, secondRemaining: 180, theme: .bubblegum)
}

