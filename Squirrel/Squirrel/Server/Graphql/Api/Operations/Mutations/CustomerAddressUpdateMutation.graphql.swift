// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension AppSchema {
  class CustomerAddressUpdateMutation: GraphQLMutation {
    static let operationName: String = "customerAddressUpdate"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation customerAddressUpdate($address: MailingAddressInput!, $customerAccessToken: String!, $id: ID!) { customerAddressUpdate( address: $address customerAccessToken: $customerAccessToken id: $id ) { __typename customerAddress { __typename id } customerUserErrors { __typename code field message } } }"#
      ))

    public var address: MailingAddressInput
    public var customerAccessToken: String
    public var id: ID

    public init(
      address: MailingAddressInput,
      customerAccessToken: String,
      id: ID
    ) {
      self.address = address
      self.customerAccessToken = customerAccessToken
      self.id = id
    }

    public var __variables: Variables? { [
      "address": address,
      "customerAccessToken": customerAccessToken,
      "id": id
    ] }

    struct Data: AppSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { AppSchema.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("customerAddressUpdate", CustomerAddressUpdate?.self, arguments: [
          "address": .variable("address"),
          "customerAccessToken": .variable("customerAccessToken"),
          "id": .variable("id")
        ]),
      ] }

      /// Updates the address of an existing customer.
      var customerAddressUpdate: CustomerAddressUpdate? { __data["customerAddressUpdate"] }

      /// CustomerAddressUpdate
      ///
      /// Parent Type: `CustomerAddressUpdatePayload`
      struct CustomerAddressUpdate: AppSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { AppSchema.Objects.CustomerAddressUpdatePayload }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("customerAddress", CustomerAddress?.self),
          .field("customerUserErrors", [CustomerUserError].self),
        ] }

        /// The customer’s updated mailing address.
        var customerAddress: CustomerAddress? { __data["customerAddress"] }
        /// The list of errors that occurred from executing the mutation.
        var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }

        /// CustomerAddressUpdate.CustomerAddress
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

        /// CustomerAddressUpdate.CustomerUserError
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