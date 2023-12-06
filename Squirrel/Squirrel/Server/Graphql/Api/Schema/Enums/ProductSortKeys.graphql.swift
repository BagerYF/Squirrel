// @generated
// This file was automatically generated and should not be edited.

import Apollo

extension AppSchema {
  /// The set of valid sort keys for the Product query.
  enum ProductSortKeys: String, EnumType {
    /// Sort by the `title` value.
    case title = "TITLE"
    /// Sort by the `product_type` value.
    case productType = "PRODUCT_TYPE"
    /// Sort by the `vendor` value.
    case vendor = "VENDOR"
    /// Sort by the `updated_at` value.
    case updatedAt = "UPDATED_AT"
    /// Sort by the `created_at` value.
    case createdAt = "CREATED_AT"
    /// Sort by the `best_selling` value.
    case bestSelling = "BEST_SELLING"
    /// Sort by the `price` value.
    case price = "PRICE"
    /// Sort by the `id` value.
    case id = "ID"
    /// Sort by relevance to the search terms when the `query` parameter is specified on the connection.
    /// Don't use this sort key when no search query is specified.
    case relevance = "RELEVANCE"
  }

}