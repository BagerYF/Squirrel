//
//  Constants.swift
//  shopifytestios
//
//  Created by Bager on 2023/2/1.
//

import Foundation
import UIKit

typealias CallBack = (_ callBack :Any) ->()
typealias CallBacks = () ->()

class AppConstants {
    static var ApolloEndpointURL = "Your end point url"
    static var XShopifyStorefrontAccessToken = "Your api token"
    static var ImagePlaceHolder = "https://img2.baidu.com/it/u=1585458193,188380332&fm=253&fmt=auto&app=138&f=JPEG?w=750&h=500"
    static var collectionGid = "Your collection id"
}

let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width
let kPublicMargin = 16.0
