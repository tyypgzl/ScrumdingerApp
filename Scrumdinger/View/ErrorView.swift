//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Tayyip Güzel on 10.01.2025.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("An error has occured!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}



#Preview {
  var wrapper: ErrorWrapper {
            ErrorWrapper(error: SampleError.errorRequired,
                         guidance: "You can safely ignore this error.")
        }
    
    ErrorView(errorWrapper: wrapper)
}

fileprivate enum SampleError: Error{
    case errorRequired
}
