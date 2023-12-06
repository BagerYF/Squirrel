// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension AppSchema {
  class CheckoutShippingLinesQuery: GraphQLQuery {
    static let operationName: String = "checkoutShippingLines"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query checkoutShippingLines($id: ID!) { node(id: $id) { __typename ... on Checkout { id webUrl availableShippingRates { __typename ready shippingRates { __typename handle priceV2 { __typename amount currencyCode } title } } } } }"#
      ))

    public var id: ID

    public init(id: ID) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

    struct Data: AppSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { AppSchema.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("node", Node?.self, arguments: ["id": .variable("id")]),
      ] }

      /// Returns a specific node by ID.
      var node: Node? { __data["node"] }

      /// Node
      ///
      /// Parent Type: `Node`
      struct Node: AppSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { AppSchema.Interfaces.Node }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .inlineFragment(AsCheckout.self),
        ] }

        var asCheckout: AsCheckout? { _asInlineFragment() }

        /// Node.AsCheckout
        ///
        /// Parent Type: `Checkout`
        struct AsCheckout: AppSchema.InlineFragment {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          typealias RootEntityType = CheckoutShippingLinesQuery.Data.Node
          static var __parentType: Apollo.ParentType { AppSchema.Objects.Checkout }
          static var __selections: [Apollo.Selection] { [
            .field("id", AppSchema.ID.self),
            .field("webUrl", AppSchema.URL.self),
            .field("availableShippingRates", AvailableShippingRates?.self),
          ] }

          /// A globally-unique ID.
          var id: AppSchema.ID { __data["id"] }
          /// The url pointing to the checkout accessible from the web.
          var webUrl: AppSchema.URL { __data["webUrl"] }
          /// The available shipping rates for this Checkout.
          /// Should only be used when checkout `requiresShipping` is `true` and
          /// the shipping address is valid.
          var availableShippingRates: AvailableShippingRates? { __data["availableShippingRates"] }

          /// Node.AsCheckout.AvailableShippingRates
          ///
          /// Parent Type: `AvailableShippingRates`
          struct AvailableShippingRates: AppSchema.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { AppSchema.Objects.AvailableShippingRates }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("ready", Bool.self),
              .field("shippingRates", [ShippingRate]?.self),
            ] }

            /// Whether or not the shipping rates are ready.
            /// The `shippingRates` field is `null` when this value is `false`.
            /// This field should be polled until its value becomes `true`.
            var ready: Bool { __data["ready"] }
            /// The fetched shipping rates. `null` until the `ready` field is `true`.
            var shippingRates: [ShippingRate]? { __data["shippingRates"] }

            /// Node.AsCheckout.AvailableShippingRates.ShippingRate
            ///
            /// Parent Type: `ShippingRate`
            struct ShippingRate: AppSchema.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { AppSchema.Objects.ShippingRate }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("handle", String.self),
                .field("priceV2", PriceV2.self),
                .field("title", String.self),
              ] }

              /// Human-readable unique identifier for this shipping rate.
              var handle: String { __data["handle"] }
              /// Price of this shipping rate.
              @available(*, deprecated, message: "Use `price` instead.")
              var priceV2: PriceV2 { __data["priceV2"] }
              /// Title of this shipping rate.
              var title: String { __data["title"] }

              /// Node.AsCheckout.AvailableShippingRates.ShippingRate.PriceV2
              ///
              /// Parent Type: `MoneyV2`
              struct PriceV2: AppSchema.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: Apollo.ParentType { AppSchema.Objects.MoneyV2 }
                static var __selections: [Apollo.Selection] { [
                  .field("__typename", String.self),
                  .field("amount", AppSchema.Decimal.self),
                  .field("currencyCode", GraphQLEnum<AppSchema.CurrencyCode>.self),
                ] }

                /// Decimal money amount.
                var amount: AppSchema.Decimal { __data["amount"] }
                /// Currency of the money.
                var currencyCode: GraphQLEnum<AppSchema.CurrencyCode> { __data["currencyCode"] }
              }
            }
          }
        }
      }
    }
  }

}