//
//  ProductDetail.swift
//  ScreenCoordinatorSample
//
//  Created by Akifumi Fukaya on 2021/08/23.
//

import SwiftUI

struct ProductDetail<ViewModel>: View where ViewModel: ProductDetailViewModel {
    @ObservedObject
    var viewModel: ViewModel

    var body: some View {
        VStack {
            Spacer()

            Text("\(viewModel.productId)")

            Spacer()

            Button(action: {

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
