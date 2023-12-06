// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension AppSchema {
  class CheckoutCreateMutation: GraphQLMutation {
    static let operationName: String = "checkoutCreate"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation checkoutCreate($input: CheckoutCreateInput!) { checkoutCreate(input: $input) { __typename checkout { __typename ...CheckoutCommon } checkoutUserErrors { __typename code field message } queueToken } }"#,
        fragments: [CheckoutCommon.self]
      ))

    public var input: CheckoutCreateInput

    public init(input: CheckoutCreateInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    struct Data: AppSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { AppSchema.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("checkoutCreate", CheckoutCreate?.self, arguments: ["input": .variable("input")]),
      ] }

      /// Creates a new checkout.
      var checkoutCreate: CheckoutCreate? { __data["checkoutCreate"] }

      /// CheckoutCreate
      ///
      /// Parent Type: `CheckoutCreatePayload`
      struct CheckoutCreate: AppSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { AppSchema.Objects.CheckoutCreatePayload }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("checkout", Checkout?.self),
          .field("checkoutUserErrors", [CheckoutUserError].self),
          .field("queueToken", String?.self),
        ] }

        /// The new checkout object.
        var checkout: Checkout? { __data["checkout"] }
        /// The list of errors that occurred from executing the mutation.
        var checkoutUserErrors: [CheckoutUserError] { __data["checkoutUserErrors"] }
        /// The checkout queue token. Available only to selected stores.
        var queueToken: String? { __data["queueToken"] }

        /// CheckoutCreate.Checkout
        ///
        /// Parent Type: `Checkout`
        struct Checkout: AppSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { AppSchema.Objects.Checkout }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .fragment(CheckoutCommon.self),
          ] }

          /// A globally-unique ID.
          var id: AppSchema.ID { __data["id"] }
          /// The url pointing to the checkout accessible from the web.
          var webUrl: AppSchema.URL { __data["webUrl"] }
          /// A list of line item objects, each one containing information about an item in the checkout.
          var lineItems: CheckoutCommon.LineItems { __data["lineItems"] }
          /// The currency code for the checkout.
          var currencyCode: GraphQLEnum<AppSchema.CurrencyCode> { __data["currencyCode"] }
          /// The amount left to be paid. This is equal to the cost of the line items, duties, taxes, and shipping, minus discounts and gift cards.
          @available(*, deprecated, message: "Use `paymentDue` instead.")
          var paymentDueV2: CheckoutCommon.PaymentDueV2 { __data["paymentDueV2"] }
          /// The price at checkout before duties, shipping, and taxes.
          @available(*, deprecated, message: "Use `subtotalPrice` instead.")
          var subtotalPriceV2: CheckoutCommon.SubtotalPriceV2 { __data["subtotalPriceV2"] }
          /// The sum of all the prices of all the items in the checkout, including taxes and duties.
          @available(*, deprecated, message: "Use `totalPrice` instead.")
          var totalPriceV2: CheckoutCommon.TotalPriceV2 { __data["totalPriceV2"] }
          /// The sum of all the taxes applied to the line items and shipping lines in the checkout.
          @available(*, deprecated, message: "Use `totalTax` instead.")
          var totalTaxV2: CheckoutCommon.TotalTaxV2 { __data["totalTaxV2"] }
          /// The sum of all the duties applied to the line items in the checkout.
          var totalDuties: CheckoutCommon.TotalDuties? { __data["totalDuties"] }
          /// The sum of all the prices of all the items in the checkout. Duties, taxes, shipping and discounts excluded.
          var lineItemsSubtotalPrice: CheckoutCommon.LineItemsSubtotalPrice { __data["lineItemsSubtotalPrice"] }
          /// Whether the checkout is tax exempt.
          var taxExempt: Bool { __data["taxExempt"] }
          /// Whether taxes are included in the line item and shipping line prices.
          var taxesIncluded: Bool { __data["taxesIncluded"] }

          struct Fragments: FragmentContainer {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            var checkoutCommon: CheckoutCommon { _toFragment() }
          }
        }

        /// CheckoutCreate.CheckoutUserError
        ///
        /// Parent Type: `CheckoutUserError`
        struct CheckoutUserError: AppSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { AppSchema.Objects.CheckoutUserError }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("code", GraphQLEnum<AppSchema.CheckoutErrorCode>?.self),
            .field("field", [String]?.self),
            .field("message", String.self),
          ] }

          /// The error code.
          var code: GraphQLEnum<AppSchema.CheckoutErrorCode>? { __data["code"] }
          /// The path to the input field that caused the error.
          var field: [String]? { __data["field"] }
          /// The error message.
          var message: String { __data["message"] }
        }
      }
    }
  }

}