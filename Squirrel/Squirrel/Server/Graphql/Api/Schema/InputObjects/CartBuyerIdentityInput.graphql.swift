// @generated
// This file was automatically generated and should not be edited.

import Apollo

extension AppSchema {
  /// Specifies the input fields to update the buyer information associated with a cart.
  /// Buyer identity is used to determine
  /// [international pricing](https://shopify.dev/custom-storefronts/internationalization/international-pricing)
  /// and should match the customer's shipping address.
  struct CartBuyerIdentityInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      email: GraphQLNullable<String> = nil,
      phone: GraphQLNullable<String> = nil,
      countryCode: GraphQLNullable<GraphQLEnum<CountryCode>> = nil,
      customerAccessToken: GraphQLNullable<String> = nil,
      deliveryAddressPreferences: GraphQLNullable<[DeliveryAddressInput]> = nil,
      walletPreferences: GraphQLNullable<[String]> = nil
    ) {
      __data = InputDict([
        "email": email,
        "phone": phone,
        "countryCode": countryCode,
        "customerAccessToken": customerAccessToken,
        "deliveryAddressPreferences": deliveryAddressPreferences,
        "walletPreferences": walletPreferences
      ])
    }

    /// The email address of the buyer that is interacting with the cart.
    var email: GraphQLNullable<String> {
      get { __data["email"] }
      set { __data["email"] = newValue }
    }

    /// The phone number of the buyer that is interacting with the cart.
    var phone: GraphQLNullable<String> {
      get { __data["phone"] }
      set { __data["phone"] = newValue }
    }

    /// The country where the buyer is located.
    var countryCode: GraphQLNullable<GraphQLEnum<CountryCode>> {
      get { __data["countryCode"] }
      set { __data["countryCode"] = newValue }
    }

    /// The access token used to identify the customer associated with the cart.
    var customerAccessToken: GraphQLNullable<String> {
      get { __data["customerAccessToken"] }
      set { __data["customerAccessToken"] = newValue }
    }

    /// An ordered set of delivery addresses tied to the buyer that is interacting with the cart.
    /// The rank of the preferences is determined by the order of the addresses in the array. Preferences
    /// can be used to populate relevant fields in the checkout flow.
    ///
    /// The input must not contain more than `250` values.
    var deliveryAddressPreferences: GraphQLNullable<[DeliveryAddressInput]> {
      get { __data["deliveryAddressPreferences"] }
      set { __data["deliveryAddressPreferences"] = newValue }
    }

    /// A set of wallet preferences tied to the buyer that is interacting with the cart.
    /// Preferences can be used to populate relevant payment fields in the checkout flow.
    ///   Accepted value: `["shop_pay"]`.
    ///
    /// The input must not contain more than `250` values.
    var walletPreferences: GraphQLNullable<[String]> {
      get { __data["walletPreferences"] }
      set { __data["walletPreferences"] = newValue }
    }
  }

}