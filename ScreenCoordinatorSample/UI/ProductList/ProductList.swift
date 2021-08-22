//
//  ProductList.swift
//  ScreenCoordinatorSample
//
//  Created by Akifumi Fukaya on 2021/08/23.
//

import SwiftUI

struct ProductList<ViewModel>: View where ViewModel: ProductListViewModel {
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
