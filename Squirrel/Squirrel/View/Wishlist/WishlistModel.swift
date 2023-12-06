//
//  WishlistModel.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/17.
//

import Foundation
import HandyJSON

class WishlistModel : HandyJSON {

    required init() {

    }

    var id : String!
    var image : String!
    var price : String!
    var title : String!
    var vendor : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        id = dictionary["id"] as? String
        image = dictionary["image"] as? String
        price = dictionary["price"] as? String
        title = dictionary["title"] as? String
        vendor = dictionary["vendor"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if id != nil{
            dictionary["id"] = id
        }
        if image != nil{
            dictionary["image"] = image
        }
        if price != nil{
            dictionary["price"] = price
        }
        if title != nil{
            dictionary["title"] = title
        }
        if vendor != nil{
            dictionary["vendor"] = vendor
        }
        return dictionary
    }
}
