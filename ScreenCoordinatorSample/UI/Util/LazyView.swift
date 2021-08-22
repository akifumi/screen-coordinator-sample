//
//  LazyView.swift
//  ScreenCoordinatorSample
//
//  Created by Akifumi Fukaya on 2021/08/23.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
