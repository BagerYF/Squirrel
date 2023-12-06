    //
    //  DesignersModel.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/1/18.
    //


import Foundation

struct DesignersModel{


    var firstCharacter : String!
    var name : String!
    var isCharacter : Bool!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(names: String){
        name = names
        let str = NSMutableString(string: name) as CFMutableString
        CFStringTransform(str, nil, kCFStringTransformToLatin, false)

        CFStringTransform(str, nil, kCFStringTransformStripDiacritics, false)

        var s: String = String(str)
        s = s.capitalized
        firstCharacter = String(s[s.startIndex])

        isCharacter = containsOnlyLetters(input: firstCharacter)
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if firstCharacter != nil{
            dictionary["firstCharacter"] = firstCharacter
        }
        if name != nil{
            dictionary["name"] = name
        }
        return dictionary
    }

}
