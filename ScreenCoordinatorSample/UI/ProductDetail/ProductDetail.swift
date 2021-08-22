//
//  ProductDetail.swift
//  ScreenCoordinatorSample
//
//  Created by Akifumi Fukaya on 2021/08/23.
//

import SwiftUI

struct ProductDetail<ViewModel>: View where ViewModel: ProductDetailViewModel {
    @EnvironmentObject
    var screenCoordinator: ScreenCoordinator

    @ObservedObject
    var viewModel: ViewModel

    var body: some View {
        VStack {
            Spacer()

            Text("\(viewModel.productId)")

            Spacer()

            Button(action: {
                screenCoordinator.presentedPopup = .init(
                    arguments: .init(
                        close: {
                            screenCoordinator.presentedPopup = .init(arguments: nil, isActive: false)
                        }
                    ),
                    isActive: true
                )
            }, label: {
                Text("Show Popup")
                    .padding()
                    .background(Color.black)
                    .cornerRadius(8.0)
            })
        }
        .navigationBarTitle("ProductDetail", displayMode: .inline)
    }
}

struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetail(viewModel: ProductDetailViewModel(arguments: .init(productId: "sample")))
    }
}
