//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Tayyip Güzel on 2.01.2025.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var store = ScrumStore()
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) {
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
                .task {
                    do {
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}
