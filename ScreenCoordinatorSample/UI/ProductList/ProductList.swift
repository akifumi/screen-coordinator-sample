//
//  ProductList.swift
//  ScreenCoordinatorSample
//
//  Created by Akifumi Fukaya on 2021/08/23.
//

import SwiftUI

struct ProductList<ViewModel>: View where ViewModel: ProductListViewModel {
    @EnvironmentObject
    var screenCoordinator: ScreenCoordinator

    @ObservedObject
    var viewModel: ViewModel

    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(viewModel.rows, id: \.id) { row in
                        Text(row.title)
                    }
                }

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
        .navigationBarTitle(Text("ProductList"), displayMode: .inline)
    }
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductList(viewModel: ProductListViewModel())
    }
}
