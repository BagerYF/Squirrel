// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension AppSchema {
  class CreateCartMutation: GraphQLMutation {
    static let operationName: String = "createCart"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation createCart($input: CartInput!) { cartCreate(input: $input) { __typename cart { __typename ...CartCommon } } }"#,
        fragments: [CartCommon.self]
      ))

    public var input: CartInput

    public init(input: CartInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    struct Data: AppSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { AppSchema.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("cartCreate", CartCreate?.self, arguments: ["input": .variable("input")]),
      ] }

      /// Creates a new cart.
      var cartCreate: CartCreate? { __data["cartCreate"] }

      /// CartCreate
      ///
      /// Parent Type: `CartCreatePayload`
      struct CartCreate: AppSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { AppSchema.Objects.CartCreatePayload }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("cart", Cart?.self),
        ] }

        /// The new cart.
        var cart: Cart? { __data["cart"] }

        /// CartCreate.Cart
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