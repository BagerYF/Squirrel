// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension AppSchema {
  class CustomerAddressCreateMutation: GraphQLMutation {
    static let operationName: String = "customerAddressCreate"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation customerAddressCreate($address: MailingAddressInput!, $customerAccessToken: String!) { customerAddressCreate( address: $address customerAccessToken: $customerAccessToken ) { __typename customerAddress { __typename id } customerUserErrors { __typename code field message } } }"#
      ))

    public var address: MailingAddressInput
    public var customerAccessToken: String

    public init(
      address: MailingAddressInput,
      customerAccessToken: String
    ) {
      self.address = address
      self.customerAccessToken = customerAccessToken
    }

    public var __variables: Variables? { [
      "address": address,
      "customerAccessToken": customerAccessToken
    ] }

    struct Data: AppSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { AppSchema.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("customerAddressCreate", CustomerAddressCreate?.self, arguments: [
          "address": .variable("address"),
          "customerAccessToken": .variable("customerAccessToken")
        ]),
      ] }

      /// Creates a new address for a customer.
      var customerAddressCreate: CustomerAddressCreate? { __data["customerAddressCreate"] }

      /// CustomerAddressCreate
      ///
      /// Parent Type: `CustomerAddressCreatePayload`
      struct CustomerAddressCreate: AppSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { AppSchema.Objects.CustomerAddressCreatePayload }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("customerAddress", CustomerAddress?.self),
          .field("customerUserErrors", [CustomerUserError].self),
        ] }

        /// The new customer address object.
        var customerAddress: CustomerAddress? { __data["customerAddress"] }
        /// The list of errors that occurred from executing the mutation.
        var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }

        /// CustomerAddressCreate.CustomerAddress
        ///
        /// Parent Type: `MailingAddress`
        struct CustomerAddress: AppSchema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { AppSchema.Objects.MailingAddress }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", AppSchema.ID.self),
          ] }

          /// A globally-unique ID.
          var id: AppSchema.ID { __data["id"] }
        }

        /// CustomerAddressCreate.CustomerUserError
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
      }
    }
  }

}