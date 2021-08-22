//
//  ProductListViewModel.swift
//  ScreenCoordinatorSample
//
//  Created by Akifumi Fukaya on 2021/08/23.
//

import Combine

final class ProductListViewModel: ObservableObject {

    init() {
        var rows: [Row] = []
        for i in 0..<100 {
            rows.append(Row(id: i, title: "Product \(i)"))
        }
        self.rows = rows
    }

    struct Row {
        let id: Int
        let title: String
    }

    let rows: [Row]
}
