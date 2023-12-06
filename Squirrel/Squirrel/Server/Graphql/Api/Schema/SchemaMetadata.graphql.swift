// @generated
// This file was automatically generated and should not be edited.

import Apollo

protocol AppSchema_SelectionSet: Apollo.SelectionSet & Apollo.RootSelectionSet
where Schema == AppSchema.SchemaMetadata {}

protocol AppSchema_InlineFragment: Apollo.SelectionSet & Apollo.InlineFragment
where Schema == AppSchema.SchemaMetadata {}

protocol AppSchema_MutableSelectionSet: Apollo.MutableRootSelectionSet
where Schema == AppSchema.SchemaMetadata {}

protocol AppSchema_MutableInlineFragment: Apollo.MutableSelectionSet & Apollo.InlineFragment
where Schema == AppSchema.SchemaMetadata {}

extension AppSchema {
  typealias ID = String

  typealias SelectionSet = AppSchema_SelectionSet

  typealias InlineFragment = AppSchema_InlineFragment

  typealias MutableSelectionSet = AppSchema_MutableSelectionSet

  typealias MutableInlineFragment = AppSchema_MutableInlineFragment

  enum SchemaMetadata: Apollo.SchemaMetadata {
    static let configuration: Apollo.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> Apollo.Object? {
      switch typename {
      case "Mutation": return AppSchema.Objects.Mutation
      case "CheckoutCreatePayload": return AppSchema.Objects.CheckoutCreatePayload
      case "Checkout": return AppSchema.Objects.Checkout
      case "AppliedGiftCard": return AppSchema.Objects.AppliedGiftCard
      case "Article": return AppSchema.Objects.Article
      case "Blog": return AppSchema.Objects.Blog
      case "Collection": return AppSchema.Objects.Collection
      case "Page": return AppSchema.Objects.Page
      case "Product": return AppSchema.Objects.Product
      case "SearchQuerySuggestion": return AppSchema.Objects.SearchQuerySuggestion
      case "Metaobject": return AppSchema.Objects.Metaobject
      case "Cart": return AppSchema.Objects.Cart
      case "Customer": return AppSchema.Objects.Customer
      case "Location": return AppSchema.Objects.Location
      case "Market": return AppSchema.Objects.Market
      case "Order": return AppSchema.Objects.Order
      case "ProductVariant": return AppSchema.Objects.ProductVariant
      case "Shop": return AppSchema.Objects.Shop
      case "CartLine": return AppSchema.Objects.CartLine
      case "ComponentizableCartLine": return AppSchema.Objects.ComponentizableCartLine
      case "CheckoutLineItem": return AppSchema.Objects.CheckoutLineItem
      case "Comment": return AppSchema.Objects.Comment
      case "ExternalVideo": return AppSchema.Objects.ExternalVideo
      case "MediaImage": return AppSchema.Objects.MediaImage
      case "Model3d": return AppSchema.Objects.Model3d
      case "Video": return AppSchema.Objects.Video
      case "GenericFile": return AppSchema.Objects.GenericFile
      case "MailingAddress": return AppSchema.Objects.MailingAddress
      case "MediaPresentation": return AppSchema.Objects.MediaPresentation
      case "Menu": return AppSchema.Objects.Menu
      case "MenuItem": return AppSchema.Objects.MenuItem
      case "Metafield": return AppSchema.Objects.Metafield
      case "Payment": return AppSchema.Objects.Payment
      case "ProductOption": return AppSchema.Objects.ProductOption
      case "ShopPolicy": return AppSchema.Objects.ShopPolicy
      case "UrlRedirect": return AppSchema.Objects.UrlRedirect
      case "CheckoutLineItemConnection": return AppSchema.Objects.CheckoutLineItemConnection
      case "CheckoutLineItemEdge": return AppSchema.Objects.CheckoutLineItemEdge
      case "MoneyV2": return AppSchema.Objects.MoneyV2
      case "CheckoutUserError": return AppSchema.Objects.CheckoutUserError
      case "CartUserError": return AppSchema.Objects.CartUserError
      case "CustomerUserError": return AppSchema.Objects.CustomerUserError
      case "MetafieldDeleteUserError": return AppSchema.Objects.MetafieldDeleteUserError
      case "MetafieldsSetUserError": return AppSchema.Objects.MetafieldsSetUserError
      case "UserError": return AppSchema.Objects.UserError
      case "CheckoutShippingAddressUpdateV2Payload": return AppSchema.Objects.CheckoutShippingAddressUpdateV2Payload
      case "AvailableShippingRates": return AppSchema.Objects.AvailableShippingRates
      case "ShippingRate": return AppSchema.Objects.ShippingRate
      case "Query": return AppSchema.Objects.Query
      case "CheckoutShippingLineUpdatePayload": return AppSchema.Objects.CheckoutShippingLineUpdatePayload
      case "CheckoutDiscountCodeApplyV2Payload": return AppSchema.Objects.CheckoutDiscountCodeApplyV2Payload
      case "CheckoutDiscountCodeRemovePayload": return AppSchema.Objects.CheckoutDiscountCodeRemovePayload
      case "CheckoutCustomerAssociateV2Payload": return AppSchema.Objects.CheckoutCustomerAssociateV2Payload
      case "CheckoutCompleteFreePayload": return AppSchema.Objects.CheckoutCompleteFreePayload
      case "CheckoutCompleteWithCreditCardV2Payload": return AppSchema.Objects.CheckoutCompleteWithCreditCardV2Payload
      case "CustomerCreatePayload": return AppSchema.Objects.CustomerCreatePayload
      case "CustomerAccessTokenCreatePayload": return AppSchema.Objects.CustomerAccessTokenCreatePayload
      case "CustomerAccessToken": return AppSchema.Objects.CustomerAccessToken
      case "MailingAddressConnection": return AppSchema.Objects.MailingAddressConnection
      case "MailingAddressEdge": return AppSchema.Objects.MailingAddressEdge
      case "OrderConnection": return AppSchema.Objects.OrderConnection
      case "OrderEdge": return AppSchema.Objects.OrderEdge
      case "OrderLineItemConnection": return AppSchema.Objects.OrderLineItemConnection
      case "OrderLineItemEdge": return AppSchema.Objects.OrderLineItemEdge
      case "OrderLineItem": return AppSchema.Objects.OrderLineItem
      case "Image": return AppSchema.Objects.Image
      case "SelectedOption": return AppSchema.Objects.SelectedOption
      case "CustomerAddressCreatePayload": return AppSchema.Objects.CustomerAddressCreatePayload
      case "CustomerAddressUpdatePayload": return AppSchema.Objects.CustomerAddressUpdatePayload
      case "CustomerAddressDeletePayload": return AppSchema.Objects.CustomerAddressDeletePayload
      case "Localization": return AppSchema.Objects.Localization
      case "Country": return AppSchema.Objects.Country
      case "Currency": return AppSchema.Objects.Currency
      case "Language": return AppSchema.Objects.Language
      case "ProductConnection": return AppSchema.Objects.ProductConnection
      case "ProductEdge": return AppSchema.Objects.ProductEdge
      case "ImageConnection": return AppSchema.Objects.ImageConnection
      case "ImageEdge": return AppSchema.Objects.ImageEdge
      case "ProductVariantConnection": return AppSchema.Objects.ProductVariantConnection
      case "ProductVariantEdge": return AppSchema.Objects.ProductVariantEdge
      case "PageInfo": return AppSchema.Objects.PageInfo
      case "Filter": return AppSchema.Objects.Filter
      case "FilterValue": return AppSchema.Objects.FilterValue
      case "ProductPriceRange": return AppSchema.Objects.ProductPriceRange
      case "BaseCartLineConnection": return AppSchema.Objects.BaseCartLineConnection
      case "BaseCartLineEdge": return AppSchema.Objects.BaseCartLineEdge
      case "CartLineCost": return AppSchema.Objects.CartLineCost
      case "Attribute": return AppSchema.Objects.Attribute
      case "CartCost": return AppSchema.Objects.CartCost
      case "CartBuyerIdentity": return AppSchema.Objects.CartBuyerIdentity
      case "CartCreatePayload": return AppSchema.Objects.CartCreatePayload
      case "CartLinesAddPayload": return AppSchema.Objects.CartLinesAddPayload
      case "CartLinesUpdatePayload": return AppSchema.Objects.CartLinesUpdatePayload
      case "CartLinesRemovePayload": return AppSchema.Objects.CartLinesRemovePayload
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}