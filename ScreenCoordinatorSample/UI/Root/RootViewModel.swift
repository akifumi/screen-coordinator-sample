//
//  RootViewModel.swift
//  ScreenCoordinatorSample
//
//  Created by Akifumi Fukaya on 2021/08/23.
//

import Combine

final class RootViewModel: ObservableObject {
    var productDetailArguments: ProductDetailViewModel.Arguments? = nil
    @Published var isProductDetailNavigationActive: Bool = false

    func openProductDetail(with productId: String) {
        productDetailArguments = .init(productId: productId)
        isProductDetailNavigationActive = true
    }
}
