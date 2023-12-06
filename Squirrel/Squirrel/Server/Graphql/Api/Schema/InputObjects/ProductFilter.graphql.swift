// @generated
// This file was automatically generated and should not be edited.

import Apollo

extension AppSchema {
  /// The input fields for a filter used to view a subset of products in a collection.
  /// By default, the `available` and `price` filters are enabled. Filters are customized with the Shopify Search & Discovery app.
  /// Learn more about [customizing storefront filtering](https://help.shopify.com/manual/online-store/themes/customizing-themes/storefront-filters).
  struct ProductFilter: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      available: GraphQLNullable<Bool> = nil,
      variantOption: GraphQLNullable<VariantOptionFilter> = nil,
      productType: GraphQLNullable<String> = nil,
      productVendor: GraphQLNullable<String> = nil,
      price: GraphQLNullable<PriceRangeFilter> = nil,
      productMetafield: GraphQLNullable<MetafieldFilter> = nil,
      variantMetafield: GraphQLNullable<MetafieldFilter> = nil,
      tag: GraphQLNullable<String> = nil
    ) {
      __data = InputDict([
        "available": available,
        "variantOption": variantOption,
        "productType": productType,
        "productVendor": productVendor,
        "price": price,
        "productMetafield": productMetafield,
        "variantMetafield": variantMetafield,
        "tag": tag
      ])
    }

    /// Filter on if the product is available for sale.
    var available: GraphQLNullable<Bool> {
      get { __data["available"] }
      set { __data["available"] = newValue }
    }

    /// A variant option to filter on.
    var variantOption: GraphQLNullable<VariantOptionFilter> {
      get { __data["variantOption"] }
      set { __data["variantOption"] = newValue }
    }

    /// The product type to filter on.
    var productType: GraphQLNullable<String> {
      get { __data["productType"] }
      set { __data["productType"] = newValue }
    }

    /// The product vendor to filter on.
    var productVendor: GraphQLNullable<String> {
      get { __data["productVendor"] }
      set { __data["productVendor"] = newValue }
    }

    /// A range of prices to filter with-in.
    var price: GraphQLNullable<PriceRangeFilter> {
      get { __data["price"] }
      set { __data["price"] = newValue }
    }

    /// A product metafield to filter on.
    var productMetafield: GraphQLNullable<MetafieldFilter> {
      get { __data["productMetafield"] }
      set { __data["productMetafield"] = newValue }
    }

    /// A variant metafield to filter on.
    var variantMetafield: GraphQLNullable<MetafieldFilter> {
      get { __data["variantMetafield"] }
      set { __data["variantMetafield"] = newValue }
    }

    /// A product tag to filter on.
    var tag: GraphQLNullable<String> {
      get { __data["tag"] }
      set { __data["tag"] = newValue }
    }
  }

}