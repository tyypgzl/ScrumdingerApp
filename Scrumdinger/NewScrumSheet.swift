//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Tayyip Güzel on 9.01.2025.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.empty
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool


    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
    }
}

#Preview {
    NewScrumSheet(scrums: .constant(DailyScrum.sampleData),isPresentingNewScrumView: .constant(true))
}
