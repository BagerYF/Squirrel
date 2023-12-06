// @generated
// This file was automatically generated and should not be edited.

import Apollo

extension AppSchema.Objects {
  /// A product represents an individual item for sale in a Shopify store. Products are often physical, but they don't have to be.
  /// For example, a digital download (such as a movie, music or ebook file) also
  /// qualifies as a product, as do services (such as equipment rental, work for hire,
  /// customization of another product or an extended warranty).
  static let Product = Apollo.Object(
    typename: "Product",
    implementedInterfaces: [
      AppSchema.Interfaces.HasMetafields.self,
      AppSchema.Interfaces.Node.self,
      AppSchema.Interfaces.OnlineStorePublishable.self,
      AppSchema.Interfaces.Trackable.self
    ]
  )
}