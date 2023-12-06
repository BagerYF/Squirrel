// @generated
// This file was automatically generated and should not be edited.

import Apollo

extension AppSchema {
  /// The input fields to create a line item on a checkout.
  struct CheckoutLineItemInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      customAttributes: GraphQLNullable<[AttributeInput]> = nil,
      quantity: Int,
      variantId: ID
    ) {
      __data = InputDict([
        "customAttributes": customAttributes,
        "quantity": quantity,
        "variantId": variantId
      ])
    }

    /// Extra information in the form of an array of Key-Value pairs about the line item.
    ///
    /// The input must not contain more than `250` values.
    var customAttributes: GraphQLNullable<[AttributeInput]> {
      get { __data["customAttributes"] }
      set { __data["customAttributes"] = newValue }
    }

    /// The quantity of the line item.
    var quantity: Int {
      get { __data["quantity"] }
      set { __data["quantity"] = newValue }
    }

    /// The ID of the product variant for the line item.
    var variantId: ID {
      get { __data["variantId"] }
      set { __data["variantId"] = newValue }
    }
  }

}