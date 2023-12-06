// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension AppSchema {
  class CustomerAccessTokenCreateMutation: GraphQLMutation {
    static let operationName: String = "customerAccessTokenCreate"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation customerAccessTokenCreate($input: CustomerAccessTokenCreateInput!) { customerAccessTokenCreate(input: $input) { __typename customerUserErrors { __typename code field message } customerAccessToken { __typename accessToken expiresAt } } }"#
      ))

    public var input: CustomerAccessTokenCreateInput

    public init(input: CustomerAccessTokenCreateInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    struct Data: AppSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { AppSchema.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("customerAccessTokenCreate", CustomerAccessTokenCreate?.self, arguments: ["input": .variable("input")]),
      ] }

      /// Creates a customer access token.
      /// The customer access token is required to modify the customer object in any way.
      var customerAccessTokenCreate: CustomerAccessTokenCreate? { __data["customerAccessTokenCreate"] }

      /// CustomerAccessTokenCreate
      ///
      /// Parent Type: `CustomerAccessTokenCreatePayload`
      struct CustomerAccessTokenCreate: AppSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { AppSchema.Objects.CustomerAccessTokenCreatePayload }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("customerUserErrors", [CustomerUserError].self),
          .field("customerAccessToken", CustomerAccessToken?.self),
        ] }

        /// The list of errors that occurred from executing the mutation.
        var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }
        /// The newly created customer access token object.
        var customerAccessToken: CustomerAccessToken? { __data["customerAccessToken"] }

        /// CustomerAccessTokenCreate.CustomerUserError
        ///
        /// Parent Type: `CustomerUserError`
        struct CustomerUserError: AppSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { AppSchema.Objects.CustomerUserError }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("code", GraphQLEnum<AppSchema.CustomerErrorCode>?.self),
            .field("field", [String]?.self),
            .field("message", String.self),
          ] }

          /// The error code.
          var code: GraphQLEnum<AppSchema.CustomerErrorCode>? { __data["code"] }
          /// The path to the input field that caused the error.
          var field: [String]? { __data["field"] }
          /// The error message.
          var message: String { __data["message"] }
        }

        /// CustomerAccessTokenCreate.CustomerAccessToken
        ///
        /// Parent Type: `CustomerAccessToken`
        struct CustomerAccessToken: AppSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { AppSchema.Objects.CustomerAccessToken }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("accessToken", String.self),
            .field("expiresAt", AppSchema.DateTime.self),
          ] }

          /// The customer’s access token.
          var accessToken: String { __data["accessToken"] }
          /// The date and time when the customer access token expires.
          var expiresAt: AppSchema.DateTime { __data["expiresAt"] }
        }
      }
    }
  }

}