// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension AppSchema {
  class UpdateProductQuantityInCartMutation: GraphQLMutation {
    static let operationName: String = "updateProductQuantityInCart"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation updateProductQuantityInCart($cartId: ID!, $lines: [CartLineUpdateInput!]!) { cartLinesUpdate(cartId: $cartId, lines: $lines) { __typename cart { __typename ...CartCommon } } }"#,
        fragments: [CartCommon.self]
      ))

    public var cartId: ID
    public var lines: [CartLineUpdateInput]

    public init(
      cartId: ID,
      lines: [CartLineUpdateInput]
    ) {
      self.cartId = cartId
      self.lines = lines
    }

    public var __variables: Variables? { [
      "cartId": cartId,
      "lines": lines
    ] }

    struct Data: AppSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { AppSchema.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("cartLinesUpdate", CartLinesUpdate?.self, arguments: [
          "cartId": .variable("cartId"),
          "lines": .variable("lines")
        ]),
      ] }

      /// Updates one or more merchandise lines on a cart.
      var cartLinesUpdate: CartLinesUpdate? { __data["cartLinesUpdate"] }

      /// CartLinesUpdate
      ///
      /// Parent Type: `CartLinesUpdatePayload`
      struct CartLinesUpdate: AppSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { AppSchema.Objects.CartLinesUpdatePayload }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("cart", Cart?.self),
        ] }

        /// The updated cart.
        var cart: Cart? { __data["cart"] }

        /// CartLinesUpdate.Cart
        ///
        /// Parent Type: `Cart`
        struct Cart: AppSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { AppSchema.Objects.Cart }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .fragment(CartCommon.self),
          ] }

          /// A globally-unique ID.
          var id: AppSchema.ID { __data["id"] }
          /// The total number of items in the cart.
          var totalQuantity: Int { __data["totalQuantity"] }
          /// The date and time when the cart was created.
          var createdAt: AppSchema.DateTime { __data["createdAt"] }
          /// The date and time when the cart was updated.
          var updatedAt: AppSchema.DateTime { __data["updatedAt"] }
          /// A list of lines containing information about the items the customer intends to purchase.
          var lines: CartCommon.Lines { __data["lines"] }
          /// The attributes associated with the cart. Attributes are represented as key-value pairs.
          var attributes: [CartCommon.Attribute] { __data["attributes"] }
          /// The estimated costs that the buyer will pay at checkout. The costs are subject to change and changes will be reflected at checkout. The `cost` field uses the `buyerIdentity` field to determine [international pricing](https://shopify.dev/custom-storefronts/internationalization/international-pricing).
          var cost: CartCommon.Cost { __data["cost"] }
          /// Information about the buyer that's interacting with the cart.
          var buyerIdentity: CartCommon.BuyerIdentity { __data["buyerIdentity"] }

          struct Fragments: FragmentContainer {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            var cartCommon: CartCommon { _toFragment() }
          }
        }
      }
    }
  }

}