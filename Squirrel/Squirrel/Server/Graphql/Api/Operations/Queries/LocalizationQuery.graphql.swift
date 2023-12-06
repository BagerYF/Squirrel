// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension AppSchema {
  class LocalizationQuery: GraphQLQuery {
    static let operationName: String = "localization"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query localization { localization { __typename availableCountries { __typename name currency { __typename name symbol isoCode } isoCode unitSystem availableLanguages { __typename name isoCode endonymName } } } }"#
      ))

    public init() {}

    struct Data: AppSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { AppSchema.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("localization", Localization.self),
      ] }

      /// Returns the localized experiences configured for the shop.
      var localization: Localization { __data["localization"] }

      /// Localization
      ///
      /// Parent Type: `Localization`
      struct Localization: AppSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { AppSchema.Objects.Localization }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("availableCountries", [AvailableCountry].self),
        ] }

        /// The list of countries with enabled localized experiences.
        var availableCountries: [AvailableCountry] { __data["availableCountries"] }

        /// Localization.AvailableCountry
        ///
        /// Parent Type: `Country`
        struct AvailableCountry: AppSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { AppSchema.Objects.Country }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
            .field("currency", Currency.self),
            .field("isoCode", GraphQLEnum<AppSchema.CountryCode>.self),
            .field("unitSystem", GraphQLEnum<AppSchema.UnitSystem>.self),
            .field("availableLanguages", [AvailableLanguage].self),
          ] }

          /// The name of the country.
          var name: String { __data["name"] }
          /// The currency of the country.
          var currency: Currency { __data["currency"] }
          /// The ISO code of the country.
          var isoCode: GraphQLEnum<AppSchema.CountryCode> { __data["isoCode"] }
          /// The unit system used in the country.
          var unitSystem: GraphQLEnum<AppSchema.UnitSystem> { __data["unitSystem"] }
          /// The languages available for the country.
          var availableLanguages: [AvailableLanguage] { __data["availableLanguages"] }

          /// Localization.AvailableCountry.Currency
          ///
          /// Parent Type: `Currency`
          struct Currency: AppSchema.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { AppSchema.Objects.Currency }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("symbol", String.self),
              .field("isoCode", GraphQLEnum<AppSchema.CurrencyCode>.self),
            ] }

            /// The name of the currency.
            var name: String { __data["name"] }
            /// The symbol of the currency.
            var symbol: String { __data["symbol"] }
            /// The ISO code of the currency.
            var isoCode: GraphQLEnum<AppSchema.CurrencyCode> { __data["isoCode"] }
          }

          /// Localization.AvailableCountry.AvailableLanguage
          ///
          /// Parent Type: `Language`
          struct AvailableLanguage: AppSchema.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { AppSchema.Objects.Language }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("name", String.self),
              .field("isoCode", GraphQLEnum<AppSchema.LanguageCode>.self),
              .field("endonymName", String.self),
            ] }

            /// The name of the language in the current language.
            var name: String { __data["name"] }
            /// The ISO code.
            var isoCode: GraphQLEnum<AppSchema.LanguageCode> { __data["isoCode"] }
            /// The name of the language in the language itself. If the language uses capitalization, it is capitalized for a mid-sentence position.
            var endonymName: String { __data["endonymName"] }
          }
        }
      }
    }
  }

}