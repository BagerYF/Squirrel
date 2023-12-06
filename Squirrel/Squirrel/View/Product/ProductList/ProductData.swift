    //
    //  ProductData.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/2/8.
    //

import Foundation

let kProductSortMap = [
    ["name": "Most Relevant", "reverse": false, "sortKey": AppSchema.ProductCollectionSortKeys.relevance],
    ["name": "Alphabetically, A-Z", "reverse": false, "sortKey": AppSchema.ProductCollectionSortKeys.title],
    ["name": "Alphabetically, Z-A", "reverse": true, "sortKey": AppSchema.ProductCollectionSortKeys.title],
    ["name": "New In", "reverse": false, "sortKey": AppSchema.ProductCollectionSortKeys.created],
    ["name": "Price, low to high", "reverse": false, "sortKey": AppSchema.ProductCollectionSortKeys.price],
    ["name": "Price, high to low", "reverse": true, "sortKey": AppSchema.ProductCollectionSortKeys.price],
]
