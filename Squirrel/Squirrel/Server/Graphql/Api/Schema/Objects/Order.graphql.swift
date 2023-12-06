// @generated
// This file was automatically generated and should not be edited.

import Apollo

extension AppSchema.Objects {
  /// An order is a customer’s completed request to purchase one or more products from a shop. An order is created when a customer completes the checkout process, during which time they provides an email address, billing address and payment information.
  static let Order = Apollo.Object(
    typename: "Order",
    implementedInterfaces: [
      AppSchema.Interfaces.HasMetafields.self,
      AppSchema.Interfaces.Node.self
    ]
  )
}