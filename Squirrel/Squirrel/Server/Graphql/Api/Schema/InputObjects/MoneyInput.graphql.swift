// @generated
// This file was automatically generated and should not be edited.

import Apollo

extension AppSchema {
  /// The input fields for a monetary value with currency.
  struct MoneyInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      amount: Decimal,
      currencyCode: GraphQLEnum<CurrencyCode>
    ) {
      __data = InputDict([
        "amount": amount,
        "currencyCode": currencyCode
      ])
    }

    /// Decimal money amount.
    var amount: Decimal {
      get { __data["amount"] }
      set { __data["amount"] = newValue }
    }

    /// Currency of the money.
    var currencyCode: GraphQLEnum<CurrencyCode> {
      get { __data["currencyCode"] }
      set { __data["currencyCode"] = newValue }
    }
  }

}