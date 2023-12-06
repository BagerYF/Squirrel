// @generated
// This file was automatically generated and should not be edited.

import Apollo

extension AppSchema {
  /// The input fields for the identity of the customer associated with the checkout.
  struct CheckoutBuyerIdentityInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      countryCode: GraphQLEnum<CountryCode>
    ) {
      __data = InputDict([
        "countryCode": countryCode
      ])
    }

    /// The country code of one of the shop's
    /// [enabled countries](https://help.shopify.com/en/manual/payments/shopify-payments/multi-currency/setup).
    /// For example, `CA`. Including this field creates a checkout in the specified country's currency.
    var countryCode: GraphQLEnum<CountryCode> {
      get { __data["countryCode"] }
      set { __data["countryCode"] = newValue }
    }
  }

}