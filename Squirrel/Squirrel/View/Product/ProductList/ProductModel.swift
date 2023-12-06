//
//  ProductModel.swift
//  shopifytestios
//
//  Created by Bager on 2023/2/8.
//

import Foundation
import HandyJSON

class ProductSortModel: HandyJSON {

    required init() {

    }

    var key : String!
    var name : String!
    var selected : Bool!
    var reverse: Bool!
    var sortKey: AppSchema.ProductCollectionSortKeys!

    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        key = dictionary["key"] as? String
        name = dictionary["name"] as? String
        selected = false
        reverse = dictionary["reverse"] as? Bool
        sortKey = dictionary["sortKey"] as? AppSchema.ProductCollectionSortKeys
    }
}
