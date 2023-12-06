// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension AppSchema {
  class CustomerQuery: GraphQLQuery {
    static let operationName: String = "customer"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query customer($customerAccessToken: String!) { customer(customerAccessToken: $customerAccessToken) { __typename id acceptsMarketing displayName email firstName lastName phone addresses(first: 100) { __typename edges { __typename node { __typename id address1 address2 city country countryCodeV2 firstName lastName name phone province provinceCode zip } } } orders(first: 100) { __typename edges { __typename node { __typename id orderNumber processedAt email name phone originalTotalPrice { __typename amount currencyCode } subtotalPriceV2 { __typename amount currencyCode } totalPriceV2 { __typename amount currencyCode } totalShippingPriceV2 { __typename amount currencyCode } totalTaxV2 { __typename amount currencyCode } currentSubtotalPrice { __typename amount currencyCode } currentTotalPrice { __typename amount currencyCode } currentTotalTax { __typename amount currencyCode } shippingAddress { __typename id address1 address2 city country countryCodeV2 firstName lastName name phone province provinceCode zip } processedAt lineItems(first: 100) { __typename edges { __typename node { __typename variant { __typename image { __typename url } title price { __typename amount currencyCode } selectedOptions { __typename name value } product { __typename productType } } title quantity originalTotalPrice { __typename amount currencyCode } } } } } } } } }"#
      ))

    public var customerAccessToken: String

    public init(customerAccessToken: String) {
      self.customerAccessToken = customerAccessToken
    }

    public var __variables: Variables? { ["customerAccessToken": customerAccessToken] }

    struct Data: AppSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { AppSchema.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("customer", Customer?.self, arguments: ["customerAccessToken": .variable("customerAccessToken")]),
      ] }

      /// The customer associated with the given access token. Tokens are obtained by using the
      /// [`customerAccessTokenCreate` mutation](https://shopify.dev/docs/api/storefront/latest/mutations/customerAccessTokenCreate).
      var customer: Customer? { __data["customer"] }

      /// Customer
      ///
      /// Parent Type: `Customer`
      struct Customer: AppSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { AppSchema.Objects.Customer }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", AppSchema.ID.self),
          .field("acceptsMarketing", Bool.self),
          .field("displayName", String.self),
          .field("email", String?.self),
          .field("firstName", String?.self),
          .field("lastName", String?.self),
          .field("phone", String?.self),
          .field("addresses", Addresses.self, arguments: ["first": 100]),
          .field("orders", Orders.self, arguments: ["first": 100]),
        ] }

        /// A unique ID for the customer.
        var id: AppSchema.ID { __data["id"] }
        /// Indicates whether the customer has consented to be sent marketing material via email.
        var acceptsMarketing: Bool { __data["acceptsMarketing"] }
        /// The customer’s name, email or phone number.
        var displayName: String { __data["displayName"] }
        /// The customer’s email address.
        var email: String? { __data["email"] }
        /// The customer’s first name.
        var firstName: String? { __data["firstName"] }
        /// The customer’s last name.
        var lastName: String? { __data["lastName"] }
        /// The customer’s phone number.
        var phone: String? { __data["phone"] }
        /// A list of addresses for the customer.
        var addresses: Addresses { __data["addresses"] }
        /// The orders associated with the customer.
        var orders: Orders { __data["orders"] }

        /// Customer.Addresses
        ///
        /// Parent Type: `MailingAddressConnection`
        struct Addresses: AppSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { AppSchema.Objects.MailingAddressConnection }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("edges", [Edge].self),
          ] }

          /// A list of edges.
          var edges: [Edge] { __data["edges"] }

          /// Customer.Addresses.Edge
          ///
          /// Parent Type: `MailingAddressEdge`
          struct Edge: AppSchema.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { AppSchema.Objects.MailingAddressEdge }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("node", Node.self),
            ] }

            /// The item at the end of MailingAddressEdge.
            var node: Node { __data["node"] }

            /// Customer.Addresses.Edge.Node
            ///
            /// Parent Type: `MailingAddress`
            struct Node: AppSchema.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { AppSchema.Objects.MailingAddress }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("id", AppSchema.ID.self),
                .field("address1", String?.self),
                .field("address2", String?.self),
                .field("city", String?.self),
                .field("country", String?.self),
                .field("countryCodeV2", GraphQLEnum<AppSchema.CountryCode>?.self),
                .field("firstName", String?.self),
                .field("lastName", String?.self),
                .field("name", String?.self),
                .field("phone", String?.self),
                .field("province", String?.self),
                .field("provinceCode", String?.self),
                .field("zip", String?.self),
              ] }

              /// A globally-unique ID.
              var id: AppSchema.ID { __data["id"] }
              /// The first line of the address. Typically the street address or PO Box number.
              var address1: String? { __data["address1"] }
              /// The second line of the address. Typically the number of the apartment, suite, or unit.
              var address2: String? { __data["address2"] }
              /// The name of the city, district, village, or town.
              var city: String? { __data["city"] }
              /// The name of the country.
              var country: String? { __data["country"] }
              /// The two-letter code for the country of the address.
              ///
              /// For example, US.
              var countryCodeV2: GraphQLEnum<AppSchema.CountryCode>? { __data["countryCodeV2"] }
              /// The first name of the customer.
              var firstName: String? { __data["firstName"] }
              /// The last name of the customer.
              var lastName: String? { __data["lastName"] }
              /// The full name of the customer, based on firstName and lastName.
              var name: String? { __data["name"] }
              /// A unique phone number for the customer.
              ///
              /// Formatted using E.164 standard. For example, _+16135551111_.
              var phone: String? { __data["phone"] }
              /// The region of the address, such as the province, state, or district.
              var province: String? { __data["province"] }
              /// The two-letter code for the region.
              ///
              /// For example, ON.
              var provinceCode: String? { __data["provinceCode"] }
              /// The zip or postal code of the address.
              var zip: String? { __data["zip"] }
            }
          }
        }

        /// Customer.Orders
        ///
        /// Parent Type: `OrderConnection`
        struct Orders: AppSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { AppSchema.Objects.OrderConnection }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("edges", [Edge].self),
          ] }

          /// A list of edges.
          var edges: [Edge] { __data["edges"] }

          /// Customer.Orders.Edge
          ///
          /// Parent Type: `OrderEdge`
          struct Edge: AppSchema.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { AppSchema.Objects.OrderEdge }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("node", Node.self),
            ] }

            /// The item at the end of OrderEdge.
            var node: Node { __data["node"] }

            /// Customer.Orders.Edge.Node
            ///
            /// Parent Type: `Order`
            struct Node: AppSchema.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { AppSchema.Objects.Order }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("id", AppSchema.ID.self),
                .field("orderNumber", Int.self),
                .field("processedAt", AppSchema.DateTime.self),
                .field("email", String?.self),
                .field("name", String.self),
                .field("phone", String?.self),
                .field("originalTotalPrice", OriginalTotalPrice.self),
                .field("subtotalPriceV2", SubtotalPriceV2?.self),
                .field("totalPriceV2", TotalPriceV2.self),
                .field("totalShippingPriceV2", TotalShippingPriceV2.self),
                .field("totalTaxV2", TotalTaxV2?.self),
                .field("currentSubtotalPrice", CurrentSubtotalPrice.self),
                .field("currentTotalPrice", CurrentTotalPrice.self),
                .field("currentTotalTax", CurrentTotalTax.self),
                .field("shippingAddress", ShippingAddress?.self),
                .field("lineItems", LineItems.self, arguments: ["first": 100]),
              ] }

              /// A globally-unique ID.
              var id: AppSchema.ID { __data["id"] }
              /// A unique numeric identifier for the order for use by shop owner and customer.
              var orderNumber: Int { __data["orderNumber"] }
              /// The date and time when the order was imported.
              /// This value can be set to dates in the past when importing from other systems.
              /// If no value is provided, it will be auto-generated based on current date and time.
              var processedAt: AppSchema.DateTime { __data["processedAt"] }
              /// The customer's email address.
              var email: String? { __data["email"] }
              /// Unique identifier for the order that appears on the order.
              /// For example, _#1000_ or _Store1001.
              var name: String { __data["name"] }
              /// The customer's phone number for receiving SMS notifications.
              var phone: String? { __data["phone"] }
              /// The total price of the order before any applied edits.
              var originalTotalPrice: OriginalTotalPrice { __data["originalTotalPrice"] }
              /// Price of the order before duties, shipping and taxes.
              @available(*, deprecated, message: "Use `subtotalPrice` instead.")
              var subtotalPriceV2: SubtotalPriceV2? { __data["subtotalPriceV2"] }
              /// The sum of all the prices of all the items in the order, duties, taxes and discounts included (must be positive).
              @available(*, deprecated, message: "Use `totalPrice` instead.")
              var totalPriceV2: TotalPriceV2 { __data["totalPriceV2"] }
              /// The total cost of shipping.
              @available(*, deprecated, message: "Use `totalShippingPrice` instead.")
              var totalShippingPriceV2: TotalShippingPriceV2 { __data["totalShippingPriceV2"] }
              /// The total cost of taxes.
              @available(*, deprecated, message: "Use `totalTax` instead.")
              var totalTaxV2: TotalTaxV2? { __data["totalTaxV2"] }
              /// The subtotal of line items and their discounts, excluding line items that have been removed. Does not contain order-level discounts, duties, shipping costs, or shipping discounts. Taxes aren't included unless the order is a taxes-included order.
              var currentSubtotalPrice: CurrentSubtotalPrice { __data["currentSubtotalPrice"] }
              /// The total amount of the order, including duties, taxes and discounts, minus amounts for line items that have been removed.
              var currentTotalPrice: CurrentTotalPrice { __data["currentTotalPrice"] }
              /// The total of all taxes applied to the order, excluding taxes for returned line items.
              var currentTotalTax: CurrentTotalTax { __data["currentTotalTax"] }
              /// The address to where the order will be shipped.
              var shippingAddress: ShippingAddress? { __data["shippingAddress"] }
              /// List of the order’s line items.
              var lineItems: LineItems { __data["lineItems"] }

              /// Customer.Orders.Edge.Node.OriginalTotalPrice
              ///
              /// Parent Type: `MoneyV2`
              struct OriginalTotalPrice: AppSchema.SelectionSet {
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

              /// Customer.Orders.Edge.Node.SubtotalPriceV2
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

              /// Customer.Orders.Edge.Node.TotalPriceV2
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

              /// Customer.Orders.Edge.Node.TotalShippingPriceV2
              ///
              /// Parent Type: `MoneyV2`
              struct TotalShippingPriceV2: AppSchema.SelectionSet {
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

              /// Customer.Orders.Edge.Node.TotalTaxV2
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

              /// Customer.Orders.Edge.Node.CurrentSubtotalPrice
              ///
              /// Parent Type: `MoneyV2`
              struct CurrentSubtotalPrice: AppSchema.SelectionSet {
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

              /// Customer.Orders.Edge.Node.CurrentTotalPrice
              ///
              /// Parent Type: `MoneyV2`
              struct CurrentTotalPrice: AppSchema.SelectionSet {
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

              /// Customer.Orders.Edge.Node.CurrentTotalTax
              ///
              /// Parent Type: `MoneyV2`
              struct CurrentTotalTax: AppSchema.SelectionSet {
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

              /// Customer.Orders.Edge.Node.ShippingAddress
              ///
              /// Parent Type: `MailingAddress`
              struct ShippingAddress: AppSchema.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: Apollo.ParentType { AppSchema.Objects.MailingAddress }
                static var __selections: [Apollo.Selection] { [
                  .field("__typename", String.self),
                  .field("id", AppSchema.ID.self),
                  .field("address1", String?.self),
                  .field("address2", String?.self),
                  .field("city", String?.self),
                  .field("country", String?.self),
                  .field("countryCodeV2", GraphQLEnum<AppSchema.CountryCode>?.self),
                  .field("firstName", String?.self),
                  .field("lastName", String?.self),
                  .field("name", String?.self),
                  .field("phone", String?.self),
                  .field("province", String?.self),
                  .field("provinceCode", String?.self),
                  .field("zip", String?.self),
                ] }

                /// A globally-unique ID.
                var id: AppSchema.ID { __data["id"] }
                /// The first line of the address. Typically the street address or PO Box number.
                var address1: String? { __data["address1"] }
                /// The second line of the address. Typically the number of the apartment, suite, or unit.
                var address2: String? { __data["address2"] }
                /// The name of the city, district, village, or town.
                var city: String? { __data["city"] }
                /// The name of the country.
                var country: String? { __data["country"] }
                /// The two-letter code for the country of the address.
                ///
                /// For example, US.
                var countryCodeV2: GraphQLEnum<AppSchema.CountryCode>? { __data["countryCodeV2"] }
                /// The first name of the customer.
                var firstName: String? { __data["firstName"] }
                /// The last name of the customer.
                var lastName: String? { __data["lastName"] }
                /// The full name of the customer, based on firstName and lastName.
                var name: String? { __data["name"] }
                /// A unique phone number for the customer.
                ///
                /// Formatted using E.164 standard. For example, _+16135551111_.
                var phone: String? { __data["phone"] }
                /// The region of the address, such as the province, state, or district.
                var province: String? { __data["province"] }
                /// The two-letter code for the region.
                ///
                /// For example, ON.
                var provinceCode: String? { __data["provinceCode"] }
                /// The zip or postal code of the address.
                var zip: String? { __data["zip"] }
              }

              /// Customer.Orders.Edge.Node.LineItems
              ///
              /// Parent Type: `OrderLineItemConnection`
              struct LineItems: AppSchema.SelectionSet {
                let __data: DataDict
                init(_dataDict: DataDict) { __data = _dataDict }

                static var __parentType: Apollo.ParentType { AppSchema.Objects.OrderLineItemConnection }
                static var __selections: [Apollo.Selection] { [
                  .field("__typename", String.self),
                  .field("edges", [Edge].self),
                ] }

                /// A list of edges.
                var edges: [Edge] { __data["edges"] }

                /// Customer.Orders.Edge.Node.LineItems.Edge
                ///
                /// Parent Type: `OrderLineItemEdge`
                struct Edge: AppSchema.SelectionSet {
                  let __data: DataDict
                  init(_dataDict: DataDict) { __data = _dataDict }

                  static var __parentType: Apollo.ParentType { AppSchema.Objects.OrderLineItemEdge }
                  static var __selections: [Apollo.Selection] { [
                    .field("__typename", String.self),
                    .field("node", Node.self),
                  ] }

                  /// The item at the end of OrderLineItemEdge.
                  var node: Node { __data["node"] }

                  /// Customer.Orders.Edge.Node.LineItems.Edge.Node
                  ///
                  /// Parent Type: `OrderLineItem`
                  struct Node: AppSchema.SelectionSet {
                    let __data: DataDict
                    init(_dataDict: DataDict) { __data = _dataDict }

                    static var __parentType: Apollo.ParentType { AppSchema.Objects.OrderLineItem }
                    static var __selections: [Apollo.Selection] { [
                      .field("__typename", String.self),
                      .field("variant", Variant?.self),
                      .field("title", String.self),
                      .field("quantity", Int.self),
                      .field("originalTotalPrice", OriginalTotalPrice.self),
                    ] }

                    /// The product variant object associated to the line item.
                    var variant: Variant? { __data["variant"] }
                    /// The title of the product combined with title of the variant.
                    var title: String { __data["title"] }
                    /// The number of products variants associated to the line item.
                    var quantity: Int { __data["quantity"] }
                    /// The total price of the line item, not including any discounts. The total price is calculated using the original unit price multiplied by the quantity, and it's displayed in the presentment currency.
                    var originalTotalPrice: OriginalTotalPrice { __data["originalTotalPrice"] }

                    /// Customer.Orders.Edge.Node.LineItems.Edge.Node.Variant
                    ///
                    /// Parent Type: `ProductVariant`
                    struct Variant: AppSchema.SelectionSet {
                      let __data: DataDict
                      init(_dataDict: DataDict) { __data = _dataDict }

                      static var __parentType: Apollo.ParentType { AppSchema.Objects.ProductVariant }
                      static var __selections: [Apollo.Selection] { [
                        .field("__typename", String.self),
                        .field("image", Image?.self),
                        .field("title", String.self),
                        .field("price", Price.self),
                        .field("selectedOptions", [SelectedOption].self),
                        .field("product", Product.self),
                      ] }

                      /// Image associated with the product variant. This field falls back to the product image if no image is available.
                      var image: Image? { __data["image"] }
                      /// The product variant’s title.
                      var title: String { __data["title"] }
                      /// The product variant’s price.
                      var price: Price { __data["price"] }
                      /// List of product options applied to the variant.
                      var selectedOptions: [SelectedOption] { __data["selectedOptions"] }
                      /// The product object that the product variant belongs to.
                      var product: Product { __data["product"] }

                      /// Customer.Orders.Edge.Node.LineItems.Edge.Node.Variant.Image
                      ///
                      /// Parent Type: `Image`
                      struct Image: AppSchema.SelectionSet {
                        let __data: DataDict
                        init(_dataDict: DataDict) { __data = _dataDict }

                        static var __parentType: Apollo.ParentType { AppSchema.Objects.Image }
                        static var __selections: [Apollo.Selection] { [
                          .field("__typename", String.self),
                          .field("url", AppSchema.URL.self),
                        ] }

                        /// The location of the image as a URL.
                        ///
                        /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
                        ///
                        /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
                        ///
                        /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
                        var url: AppSchema.URL { __data["url"] }
                      }

                      /// Customer.Orders.Edge.Node.LineItems.Edge.Node.Variant.Price
                      ///
                      /// Parent Type: `MoneyV2`
                      struct Price: AppSchema.SelectionSet {
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

                      /// Customer.Orders.Edge.Node.LineItems.Edge.Node.Variant.SelectedOption
                      ///
                      /// Parent Type: `SelectedOption`
                      struct SelectedOption: AppSchema.SelectionSet {
                        let __data: DataDict
                        init(_dataDict: DataDict) { __data = _dataDict }

                        static var __parentType: Apollo.ParentType { AppSchema.Objects.SelectedOption }
                        static var __selections: [Apollo.Selection] { [
                          .field("__typename", String.self),
                          .field("name", String.self),
                          .field("value", String.self),
                        ] }

                        /// The product option’s name.
                        var name: String { __data["name"] }
                        /// The product option’s value.
                        var value: String { __data["value"] }
                      }

                      /// Customer.Orders.Edge.Node.LineItems.Edge.Node.Variant.Product
                      ///
                      /// Parent Type: `Product`
                      struct Product: AppSchema.SelectionSet {
                        let __data: DataDict
                        init(_dataDict: DataDict) { __data = _dataDict }

                        static var __parentType: Apollo.ParentType { AppSchema.Objects.Product }
                        static var __selections: [Apollo.Selection] { [
                          .field("__typename", String.self),
                          .field("productType", String.self),
                        ] }

                        /// A categorization that a product can be tagged with, commonly used for filtering and searching.
                        var productType: String { __data["productType"] }
                      }
                    }

                    /// Customer.Orders.Edge.Node.LineItems.Edge.Node.OriginalTotalPrice
                    ///
                    /// Parent Type: `MoneyV2`
                    struct OriginalTotalPrice: AppSchema.SelectionSet {
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
    }
  }

}