// @generated
// This file was automatically generated and should not be edited.

import Apollo

extension AppSchema {
  /// The input fields for delivery address preferences.
  struct DeliveryAddressInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      deliveryAddress: GraphQLNullable<MailingAddressInput> = nil,
      customerAddressId: GraphQLNullable<ID> = nil
    ) {
      __data = InputDict([
        "deliveryAddress": deliveryAddress,
        "customerAddressId": customerAddressId
      ])
    }

    /// A delivery address preference of a buyer that is interacting with the cart.
    var deliveryAddress: GraphQLNullable<MailingAddressInput> {
      get { __data["deliveryAddress"] }
      set { __data["deliveryAddress"] = newValue }
    }

    /// The ID of a customer address that is associated with the buyer that is interacting with the cart.
    var customerAddressId: GraphQLNullable<ID> {
      get { __data["customerAddressId"] }
      set { __data["customerAddressId"] = newValue }
    }
  }

}