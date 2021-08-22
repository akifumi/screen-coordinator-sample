//
//  Popup.swift
//  ScreenCoordinatorSample
//
//  Created by Akifumi Fukaya on 2021/08/23.
//

import SwiftUI

struct Popup: View {

    final class State: ObservableObject {
        let close: () -> Void

        init(close: @escaping () -> Void) {
            self.close = close
        }
    }

    @ObservedObject
    var state: State

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Popup")
                    .cornerRadius(16)

                Button("Close") {
                    state.close()
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(4.0)
        }
    }
}

struct Popup_Previews: PreviewProvider {
    static var previews: some View {
        Popup(state: Popup.State(close: {}))
    }
}
