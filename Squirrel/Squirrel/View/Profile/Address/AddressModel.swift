//
//  AddressModel.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/27.
//

import UIKit
import HandyJSON

class CountryModel: HandyJSON {
    required init() {

    }


    var id : String!
    var code : String!
    var currencyCode : String!
    var flagPath : String!
    var name : String!
    var provinces : [CountryModel]!
    var firstCharacter : String!
    var isCharacter : Bool!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    required init(fromDictionary dictionary: [String:Any]){
        id = dictionary["_id"] as? String
        code = dictionary["code"] as? String
        currencyCode = dictionary["currencyCode"] as? String
        flagPath = dictionary["flagPath"] as? String
        name = dictionary["name"] as? String

        let str = NSMutableString(string: name) as CFMutableString
        CFStringTransform(str, nil, kCFStringTransformToLatin, false)

        CFStringTransform(str, nil, kCFStringTransformStripDiacritics, false)

        var s: String = String(str)
        s = s.capitalized
        firstCharacter = String(s[s.startIndex])

        isCharacter = containsOnlyLetters(input: firstCharacter)

        provinces = [CountryModel]()
        if let provincesArray = dictionary["provinces"] as? [[String:Any]]{
            for dic in provincesArray{
                let value = CountryModel(fromDictionary: dic)
                provinces.append(value)
            }
        }
    }
}
