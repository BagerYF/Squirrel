// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension AppSchema {
  class ProductRecommendationsQuery: GraphQLQuery {
    static let operationName: String = "productRecommendations"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query productRecommendations($productId: ID!) { productRecommendations(productId: $productId) { __typename id title vendor productType images(first: 5) { __typename edges { __typename node { __typename id url } } } variants(first: 5) { __typename edges { __typename node { __typename id title availableForSale currentlyNotInStock price { __typename amount currencyCode } quantityAvailable selectedOptions { __typename name value } image { __typename url } } } } priceRange { __typename maxVariantPrice { __typename amount } minVariantPrice { __typename amount } } } }"#
      ))

    public var productId: ID

    public init(productId: ID) {
      self.productId = productId
    }

    public var __variables: Variables? { ["productId": productId] }

    struct Data: AppSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { AppSchema.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("productRecommendations", [ProductRecommendation]?.self, arguments: ["productId": .variable("productId")]),
      ] }

      /// Find recommended products related to a given `product_id`.
      /// To learn more about how recommendations are generated, see
      /// [*Showing product recommendations on product pages*](https://help.shopify.com/themes/development/recommended-products).
      var productRecommendations: [ProductRecommendation]? { __data["productRecommendations"] }

      /// ProductRecommendation
      ///
      /// Parent Type: `Product`
      struct ProductRecommendation: AppSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { AppSchema.Objects.Product }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", AppSchema.ID.self),
          .field("title", String.self),
          .field("vendor", String.self),
          .field("productType", String.self),
          .field("images", Images.self, arguments: ["first": 5]),
          .field("variants", Variants.self, arguments: ["first": 5]),
          .field("priceRange", PriceRange.self),
        ] }

        /// A globally-unique ID.
        var id: AppSchema.ID { __data["id"] }
        /// The product’s title.
        var title: String { __data["title"] }
        /// The product’s vendor name.
        var vendor: String { __data["vendor"] }
        /// A categorization that a product can be tagged with, commonly used for filtering and searching.
        var productType: String { __data["productType"] }
        /// List of images associated with the product.
        var images: Images { __data["images"] }
        /// List of the product’s variants.
        var variants: Variants { __data["variants"] }
        /// The price range.
        var priceRange: PriceRange { __data["priceRange"] }

        /// ProductRecommendation.Images
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

          /// ProductRecommendation.Images.Edge
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

            /// ProductRecommendation.Images.Edge.Node
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

        /// ProductRecommendation.Variants
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

          /// ProductRecommendation.Variants.Edge
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

            /// ProductRecommendation.Variants.Edge.Node
            ///
            /// Parent Type: `ProductVariant`
            struct Node: AppSchema.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { AppSchema.Objects.ProductVariant }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("id", AppSchema.ID.self),
                .field("title", String.self),
                .field("availableForSale", Bool.self),
                .field("currentlyNotInStock", Bool.self),
                .field("price", Price.self),
                .field("quantityAvailable", Int?.self),
                .field("selectedOptions", [SelectedOption].self),
                .field("image", Image?.self),
              ] }

              /// A globally-unique ID.
              var id: AppSchema.ID { __data["id"] }
              /// The product variant’s title.
              var title: String { __data["title"] }
              /// Indicates if the product variant is available for sale.
              var availableForSale: Bool { __data["availableForSale"] }
              /// Whether a product is out of stock but still available for purchase (used for backorders).
              var currentlyNotInStock: Bool { __data["currentlyNotInStock"] }
              /// The product variant’s price.
              var price: Price { __data["price"] }
              /// The total sellable quantity of the variant for online sales channels.
              var quantityAvailable: Int? { __data["quantityAvailable"] }
              /// List of product options applied to the variant.
              var selectedOptions: [SelectedOption] { __data["selectedOptions"] }
              /// Image associated with the product variant. This field falls back to the product image if no image is available.
              var image: Image? { __data["image"] }

              /// ProductRecommendation.Variants.Edge.Node.Price
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

              /// ProductRecommendation.Variants.Edge.Node.SelectedOption
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

              /// ProductRecommendation.Variants.Edge.Node.Image
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
            }
          }
        }

        /// ProductRecommendation.PriceRange
        ///
        /// Parent Type: `ProductPriceRange`
        struct PriceRange: AppSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { AppSchema.Objects.ProductPriceRange }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("maxVariantPrice", MaxVariantPrice.self),
            .field("minVariantPrice", MinVariantPrice.self),
          ] }

          /// The highest variant's price.
          var maxVariantPrice: MaxVariantPrice { __data["maxVariantPrice"] }
          /// The lowest variant's price.
          var minVariantPrice: MinVariantPrice { __data["minVariantPrice"] }

          /// ProductRecommendation.PriceRange.MaxVariantPrice
          ///
          /// Parent Type: `MoneyV2`
          struct MaxVariantPrice: AppSchema.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { AppSchema.Objects.MoneyV2 }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("amount", AppSchema.Decimal.self),
            ] }

            /// Decimal money amount.
            var amount: AppSchema.Decimal { __data["amount"] }
          }

          /// ProductRecommendation.PriceRange.MinVariantPrice
          ///
          /// Parent Type: `MoneyV2`
          struct MinVariantPrice: AppSchema.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { AppSchema.Objects.MoneyV2 }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("amount", AppSchema.Decimal.self),
            ] }

            /// Decimal money amount.
            var amount: AppSchema.Decimal { __data["amount"] }
          }
        }
      }
    }
  }

}
