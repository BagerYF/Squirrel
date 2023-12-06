// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension AppSchema {
  class CustomerCreateMutation: GraphQLMutation {
    static let operationName: String = "customerCreate"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation customerCreate($input: CustomerCreateInput!) { customerCreate(input: $input) { __typename customerUserErrors { __typename code field message } customer { __typename id } } }"#
      ))

    public var input: CustomerCreateInput

    public init(input: CustomerCreateInput) {
      self.input = input
    }

    public var __variables: Variables? { ["input": input] }

    struct Data: AppSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { AppSchema.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("customerCreate", CustomerCreate?.self, arguments: ["input": .variable("input")]),
      ] }

      /// Creates a new customer.
      var customerCreate: CustomerCreate? { __data["customerCreate"] }

      /// CustomerCreate
      ///
      /// Parent Type: `CustomerCreatePayload`
      struct CustomerCreate: AppSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { AppSchema.Objects.CustomerCreatePayload }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("customerUserErrors", [CustomerUserError].self),
          .field("customer", Customer?.self),
        ] }

        /// The list of errors that occurred from executing the mutation.
        var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }
        /// The created customer object.
        var customer: Customer? { __data["customer"] }

        /// CustomerCreate.CustomerUserError
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

        /// CustomerCreate.Customer
        ///
        /// Parent Type: `Customer`
        struct Customer: AppSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { AppSchema.Objects.Customer }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", AppSchema.ID.self),
          ] }

          /// A unique ID for the customer.
          var id: AppSchema.ID { __data["id"] }
        }
      }
    }
  }

}