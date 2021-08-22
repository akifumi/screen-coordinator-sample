//
//  ProductDetailViewModel.swift
//  ScreenCoordinatorSample
//
//  Created by Akifumi Fukaya on 2021/08/23.
//

import Combine

final class ProductDetailViewModel: ObservableObject {

    struct Arguments {
        let productId: String
    }

    init(arguments: Arguments) {
        self.productId = arguments.productId
    }

    let productId: String
}
