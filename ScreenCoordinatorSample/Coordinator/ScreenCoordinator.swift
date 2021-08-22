//
//  ScreenCoordinator.swift
//  ScreenCoordinatorSample
//
//  Created by Akifumi Fukaya on 2021/08/23.
//

import Combine

final class ScreenCoordinator: ObservableObject {

    @Published var presentedPopup = Destination<Popup.State>(arguments: nil, isActive: false)

    struct Destination<Arguments> {
        var arguments: Arguments?
        var isActive: Bool
    }
}
