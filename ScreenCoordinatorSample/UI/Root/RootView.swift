//
//  RootView.swift
//  ScreenCoordinatorSample
//
//  Created by Akifumi Fukaya on 2021/08/23.
//

import SwiftUI

struct RootView<ViewModel>: View where ViewModel: RootViewModel {
    @ObservedObject
    var viewModel: ViewModel

    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    if let arguments = viewModel.productDetailArguments {
                        NavigationLink(
                            destination: LazyView(ProductDetail(viewModel: ProductDetailViewModel(arguments: arguments))),
                            isActive: $viewModel.isProductDetailNavigationActive,
                            label: {
                                EmptyView()
                            })
                            .opacity(0)
                    }

                    VStack {
                        Spacer()

                        Text("RootView")
                            .padding()

                        Button(action: {
                            viewModel.openProductDetail(with: "product_x")
                        }, label: {
                            Text("Open ProductDetail")
                        })

                        Spacer()
                    }
                }
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(viewModel: RootViewModel())
    }
}
