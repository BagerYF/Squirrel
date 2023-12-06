// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension AppSchema {
  class GetProductByIdQuery: GraphQLQuery {
    static let operationName: String = "getProductById"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getProductById($id: ID!) { product(id: $id) { __typename id title vendor productType handle description images(first: 5) { __typename edges { __typename node { __typename id url } } } variants(first: 10) { __typename edges { __typename node { __typename id compareAtPrice { __typename amount currencyCode } title price { __typename amount currencyCode } price { __typename amount currencyCode } quantityAvailable selectedOptions { __typename name value } } } } } }"#
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
        .field("product", Product?.self, arguments: ["id": .variable("id")]),
      ] }

      /// Fetch a specific `Product` by one of its unique attributes.
      var product: Product? { __data["product"] }

      /// Product
      ///
      /// Parent Type: `Product`
      struct Product: AppSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { AppSchema.Objects.Product }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", AppSchema.ID.self),
          .field("title", String.self),
          .field("vendor", String.self),
          .field("productType", String.self),
          .field("handle", String.self),
          .field("description", String.self),
          .field("images", Images.self, arguments: ["first": 5]),
          .field("variants", Variants.self, arguments: ["first": 10]),
        ] }

        /// A globally-unique ID.
        var id: AppSchema.ID { __data["id"] }
        /// The product’s title.
        var title: String { __data["title"] }
        /// The product’s vendor name.
        var vendor: String { __data["vendor"] }
        /// A categorization that a product can be tagged with, commonly used for filtering and searching.
        var productType: String { __data["productType"] }
        /// A human-friendly unique string for the Product automatically generated from its title.
        /// They are used by the Liquid templating language to refer to objects.
        var handle: String { __data["handle"] }
        /// Stripped description of the product, single line with HTML tags removed.
        var description: String { __data["description"] }
        /// List of images associated with the product.
        var images: Images { __data["images"] }
        /// List of the product’s variants.
        var variants: Variants { __data["variants"] }

        /// Product.Images
        ///
        /// Parent Type: `ImageConnection`
        struct Images: AppSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { AppSchema.Objects.ImageConnection }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("edges", [Edge].self),
          ] }

          /// A list of edges.
          var edges: [Edge] { __data["edges"] }

          /// Product.Images.Edge
          ///
          /// Parent Type: `ImageEdge`
          struct Edge: AppSchema.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { AppSchema.Objects.ImageEdge }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("node", Node.self),
            ] }

            /// The item at the end of ImageEdge.
            var node: Node { __data["node"] }

            /// Product.Images.Edge.Node
            ///
            /// Parent Type: `Image`
            struct Node: AppSchema.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { AppSchema.Objects.Image }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("id", AppSchema.ID?.self),
                .field("url", AppSchema.URL.self),
              ] }

              /// A unique ID for the image.
              var id: AppSchema.ID? { __data["id"] }
              /// The location of the image as a URL.
              ///
              /// If no transform options are specified, then the original image will be preserved including any pre-applied transforms.
              ///
              /// All transformation options are considered "best-effort". Any transformation that the original image type doesn't support will be ignored.
              ///
              /// If you need multiple variations of the same image, then you can use [GraphQL aliases](https://graphql.org/learn/queries/#aliases).
              var url: AppSchema.URL { __data["url"] }
            }
          }
        }

        /// Product.Variants
        ///
        /// Parent Type: `ProductVariantConnection`
        struct Variants: AppSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { AppSchema.Objects.ProductVariantConnection }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("edges", [Edge].self),
          ] }

          /// A list of edges.
          var edges: [Edge] { __data["edges"] }

          /// Product.Variants.Edge
          ///
          /// Parent Type: `ProductVariantEdge`
          struct Edge: AppSchema.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { AppSchema.Objects.ProductVariantEdge }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("node", Node.self),
            ] }

            /// The item at the end of ProductVariantEdge.
            var node: Node { __data["node"] }

            /// Product.Variants.Edge.Node
            ///
            /// Parent Type: `ProductVariant`
            struct Node: AppSchema.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { AppSchema.Objects.ProductVariant }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("id", AppSchema.ID.self),
                .field("compareAtPrice", CompareAtPrice?.self),
                .field("title", String.self),
                .field("price", Price.self),
                .field("quantityAvailable", Int?.self),
                .field("selectedOptions", [SelectedOption].self),
              ] }

              /// A globally-unique ID.
              var id: AppSchema.ID { __data["id"] }
              /// The compare at price of the variant. This can be used to mark a variant as on sale, when `compareAtPrice` is higher than `price`.
              var compareAtPrice: CompareAtPrice? { __data["compareAtPrice"] }
              /// The product variant’s title.
              var title: String { __data["title"] }
              /// The product variant’s price.
              var price: Price { __data["price"] }
              /// The total sellable quantity of the variant for online sales channels.
              var quantityAvailable: Int? { __data["quantityAvailable"] }
              /// List of product options applied to the variant.
              var selectedOptions: [SelectedOption] { __data["selectedOptions"] }

              /// Product.Variants.Edge.Node.CompareAtPrice
              ///
              /// Parent Type: `MoneyV2`
              struct CompareAtPrice: AppSchema.SelectionSet {
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

              /// Product.Variants.Edge.Node.Price
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

              /// Product.Variants.Edge.Node.SelectedOption
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
            }
          }
        }
      }
    }
  }

}