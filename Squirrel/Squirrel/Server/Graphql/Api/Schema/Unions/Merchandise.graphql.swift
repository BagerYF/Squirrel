// @generated
// This file was automatically generated and should not be edited.

import Apollo

extension AppSchema.Unions {
  /// The merchandise to be purchased at checkout.
  static let Merchandise = Union(
    name: "Merchandise",
    possibleTypes: [AppSchema.Objects.ProductVariant.self]
  )
}