// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension AppSchema {
  class CustomerAddressDeleteMutation: GraphQLMutation {
    static let operationName: String = "customerAddressDelete"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation customerAddressDelete($customerAccessToken: String!, $id: ID!) { customerAddressDelete(customerAccessToken: $customerAccessToken, id: $id) { __typename customerUserErrors { __typename code field message } deletedCustomerAddressId } }"#
      ))

    public var customerAccessToken: String
    public var id: ID

    public init(
      customerAccessToken: String,
      id: ID
    ) {
      self.customerAccessToken = customerAccessToken
      self.id = id
    }

    public var __variables: Variables? { [
      "customerAccessToken": customerAccessToken,
      "id": id
    ] }

    struct Data: AppSchema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { AppSchema.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("customerAddressDelete", CustomerAddressDelete?.self, arguments: [
          "customerAccessToken": .variable("customerAccessToken"),
          "id": .variable("id")
        ]),
      ] }

      /// Permanently deletes the address of an existing customer.
      var customerAddressDelete: CustomerAddressDelete? { __data["customerAddressDelete"] }

      /// CustomerAddressDelete
      ///
      /// Parent Type: `CustomerAddressDeletePayload`
      struct CustomerAddressDelete: AppSchema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { AppSchema.Objects.CustomerAddressDeletePayload }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("customerUserErrors", [CustomerUserError].self),
          .field("deletedCustomerAddressId", String?.self),
        ] }

        /// The list of errors that occurred from executing the mutation.
        var customerUserErrors: [CustomerUserError] { __data["customerUserErrors"] }
        /// ID of the deleted customer address.
        var deletedCustomerAddressId: String? { __data["deletedCustomerAddressId"] }

        /// CustomerAddressDelete.CustomerUserError
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