// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension AppSchema {
  struct CheckoutCommon: AppSchema.SelectionSet, Fragment {
    static var fragmentDefinition: StaticString {
      #"fragment CheckoutCommon on Checkout { __typename id webUrl lineItems(first: 5) { __typename edges { __typename node { __typename id title quantity } } } currencyCode paymentDueV2 { __typename amount currencyCode } subtotalPriceV2 { __typename amount currencyCode } totalPriceV2 { __typename amount currencyCode } totalTaxV2 { __typename amount currencyCode } totalDuties { __typename amount currencyCode } lineItemsSubtotalPrice { __typename amount currencyCode } taxExempt taxesIncluded }"#
    }

    let __data: DataDict
    init(_dataDict: DataDict) { __data = _dataDict }

    static var __parentType: Apollo.ParentType { AppSchema.Objects.Checkout }
    static var __selections: [Apollo.Selection] { [
      .field("__typename", String.self),
      .field("id", AppSchema.ID.self),
      .field("webUrl", AppSchema.URL.self),
      .field("lineItems", LineItems.self, arguments: ["first": 5]),
      .field("currencyCode", GraphQLEnum<AppSchema.CurrencyCode>.self),
      .field("paymentDueV2", PaymentDueV2.self),
      .field("subtotalPriceV2", SubtotalPriceV2.self),
      .field("totalPriceV2", TotalPriceV2.self),
      .field("totalTaxV2", TotalTaxV2.self),
      .field("totalDuties", TotalDuties?.self),
      .field("lineItemsSubtotalPrice", LineItemsSubtotalPrice.self),
      .field("taxExempt", Bool.self),
      .field("taxesIncluded", Bool.self),
    ] }

    /// A globally-unique ID.
    var id: AppSchema.ID { __data["id"] }
    /// The url pointing to the checkout accessible from the web.
    var webUrl: AppSchema.URL { __data["webUrl"] }
    /// A list of line item objects, each one containing information about an item in the checkout.
    var lineItems: LineItems { __data["lineItems"] }
    /// The currency code for the checkout.
    var currencyCode: GraphQLEnum<AppSchema.CurrencyCode> { __data["currencyCode"] }
    /// The amount left to be paid. This is equal to the cost of the line items, duties, taxes, and shipping, minus discounts and gift cards.
    @available(*, deprecated, message: "Use `paymentDue` instead.")
    var paymentDueV2: PaymentDueV2 { __data["paymentDueV2"] }
    /// The price at checkout before duties, shipping, and taxes.
    @available(*, deprecated, message: "Use `subtotalPrice` instead.")
    var subtotalPriceV2: SubtotalPriceV2 { __data["subtotalPriceV2"] }
    /// The sum of all the prices of all the items in the checkout, including taxes and duties.
    @available(*, deprecated, message: "Use `totalPrice` instead.")
    var totalPriceV2: TotalPriceV2 { __data["totalPriceV2"] }
    /// The sum of all the taxes applied to the line items and shipping lines in the checkout.
    @available(*, deprecated, message: "Use `totalTax` instead.")
    var totalTaxV2: TotalTaxV2 { __data["totalTaxV2"] }
    /// The sum of all the duties applied to the line items in the checkout.
    var totalDuties: TotalDuties? { __data["totalDuties"] }
    /// The sum of all the prices of all the items in the checkout. Duties, taxes, shipping and discounts excluded.
    var lineItemsSubtotalPrice: LineItemsSubtotalPrice { __data["lineItemsSubtotalPrice"] }
    /// Whether the checkout is tax exempt.
    var taxExempt: Bool { __data["taxExempt"] }
    /// Whether taxes are included in the line item and shipping line prices.
    var taxesIncluded: Bool { __data["taxesIncluded"] }

    /// LineItems
    ///
    /// Parent Type: `CheckoutLineItemConnection`
    struct LineItems: AppSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { AppSchema.Objects.CheckoutLineItemConnection }
      static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("edges", [Edge].self),
      ] }

      /// A list of edges.
      var edges: [Edge] { __data["edges"] }

      /// LineItems.Edge
      ///
      /// Parent Type: `CheckoutLineItemEdge`
      struct Edge: AppSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { AppSchema.Objects.CheckoutLineItemEdge }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("node", Node.self),
        ] }

        /// The item at the end of CheckoutLineItemEdge.
        var node: Node { __data["node"] }

        /// LineItems.Edge.Node
        ///
        /// Parent Type: `CheckoutLineItem`
        struct Node: AppSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { AppSchema.Objects.CheckoutLineItem }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", AppSchema.ID.self),
            .field("title", String.self),
            .field("quantity", Int.self),
          ] }

          /// A globally-unique ID.
          var id: AppSchema.ID { __data["id"] }
          /// Title of the line item. Defaults to the product's title.
          var title: String { __data["title"] }
          /// The quantity of the line item.
          var quantity: Int { __data["quantity"] }
        }
      }
    }

    /// PaymentDueV2
    ///
    /// Parent Type: `MoneyV2`
    struct PaymentDueV2: AppSchema.SelectionSet {
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

    /// SubtotalPriceV2
    ///
    /// Parent Type: `MoneyV2`
    struct SubtotalPriceV2: AppSchema.SelectionSet {
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

    /// TotalPriceV2
    ///
    /// Parent Type: `MoneyV2`
    struct TotalPriceV2: AppSchema.SelectionSet {
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

    /// TotalTaxV2
    ///
    /// Parent Type: `MoneyV2`
    struct TotalTaxV2: AppSchema.SelectionSet {
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

    /// TotalDuties
    ///
    /// Parent Type: `MoneyV2`
    struct TotalDuties: AppSchema.SelectionSet {
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

    /// LineItemsSubtotalPrice
    ///
    /// Parent Type: `MoneyV2`
    struct LineItemsSubtotalPrice: AppSchema.SelectionSet {
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