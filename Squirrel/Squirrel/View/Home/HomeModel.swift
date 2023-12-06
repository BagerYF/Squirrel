    //
    //  HomeModel.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/1/30.
    //

import Foundation
import HandyJSON

class HomeModel : HandyJSON{
    required init() {

    }


    var id : String!
    var enabled : Bool!
    var items : [Item]!
    var link : String!
    var name : String!
    var shop : Shop!
    var subTitle : String!
    var title : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    required init(fromDictionary dictionary: [String:Any]){
        id = dictionary["_id"] as? String
        enabled = dictionary["enabled"] as? Bool
        items = [Item]()
        if let itemsArray = dictionary["items"] as? [[String:Any]]{
            for dic in itemsArray{
                let value = Item(fromDictionary: dic)
                items.append(value)
            }
        }
        link = dictionary["link"] as? String
        name = dictionary["name"] as? String
        if let shopData = dictionary["shop"] as? [String:Any]{
            shop = Shop(fromDictionary: shopData)
        }
        subTitle = dictionary["subTitle"] as? String
        title = dictionary["title"] as? String
    }

}


class Shop : HandyJSON{
    required init() {
        
    }


    var id : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    required init(fromDictionary dictionary: [String:Any]){
        id = dictionary["_id"] as? String
    }

}

class Item : HandyJSON{
    required init() {

    }


    var absoluteImageUrl : String!
    var absoluteMobileImageUrl : String!
    var brand : String!
    var image : String!
    var mobileImage : String!
    var productName : String!
    var text : String!
    var url : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        absoluteImageUrl = dictionary["absoluteImageUrl"] as? String
        absoluteMobileImageUrl = dictionary["absoluteMobileImageUrl"] as? String
        brand = dictionary["brand"] as? String
        image = dictionary["image"] as? String
        mobileImage = dictionary["mobileImage"] as? String
        productName = dictionary["productName"] as? String
        text = dictionary["text"] as? String
        url = dictionary["url"] as? String
    }

}
