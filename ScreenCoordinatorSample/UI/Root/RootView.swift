//
//  RootView.swift
//  ScreenCoordinatorSample
//
//  Created by Akifumi Fukaya on 2021/08/23.
//

import SwiftUI

struct RootView<ViewModel>: View where ViewModel: RootViewModel {
    @EnvironmentObject
    var screenCoordinator: ScreenCoordinator

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
                }
            }

            if screenCoordinator.presentedPopup.isActive, let arguments = screenCoordinator.presentedPopup.arguments {
                Popup(state: arguments)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(viewModel: RootViewModel())
            .environmentObject(ScreenCoordinator())
    }
}
