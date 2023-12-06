// @generated
// This file was automatically generated and should not be edited.

import Apollo

extension AppSchema {
  /// The set of valid sort keys for the ProductCollection query.
  enum ProductCollectionSortKeys: String, EnumType {
    /// Sort by the `title` value.
    case title = "TITLE"
    /// Sort by the `price` value.
    case price = "PRICE"
    /// Sort by the `best-selling` value.
    case bestSelling = "BEST_SELLING"
    /// Sort by the `created` value.
    case created = "CREATED"
    /// Sort by the `id` value.
    case id = "ID"
    /// Sort by the `manual` value.
    case manual = "MANUAL"
    /// Sort by the `collection-default` value.
    case collectionDefault = "COLLECTION_DEFAULT"
    /// Sort by relevance to the search terms when the `query` parameter is specified on the connection.
    /// Don't use this sort key when no search query is specified.
    case relevance = "RELEVANCE"
  }

}