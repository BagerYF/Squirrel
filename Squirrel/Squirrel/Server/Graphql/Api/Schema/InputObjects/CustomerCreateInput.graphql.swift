// @generated
// This file was automatically generated and should not be edited.

import Apollo

extension AppSchema {
  /// The input fields to create a new customer.
  struct CustomerCreateInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      firstName: GraphQLNullable<String> = nil,
      lastName: GraphQLNullable<String> = nil,
      email: String,
      phone: GraphQLNullable<String> = nil,
      password: String,
      acceptsMarketing: GraphQLNullable<Bool> = nil
    ) {
      __data = InputDict([
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "password": password,
        "acceptsMarketing": acceptsMarketing
      ])
    }

    /// The customer’s first name.
    var firstName: GraphQLNullable<String> {
      get { __data["firstName"] }
      set { __data["firstName"] = newValue }
    }

    /// The customer’s last name.
    var lastName: GraphQLNullable<String> {
      get { __data["lastName"] }
      set { __data["lastName"] = newValue }
    }

    /// The customer’s email.
    var email: String {
      get { __data["email"] }
      set { __data["email"] = newValue }
    }

    /// A unique phone number for the customer.
    ///
    /// Formatted using E.164 standard. For example, _+16135551111_.
    var phone: GraphQLNullable<String> {
      get { __data["phone"] }
      set { __data["phone"] = newValue }
    }

    /// The login password used by the customer.
    var password: String {
      get { __data["password"] }
      set { __data["password"] = newValue }
    }

    /// Indicates whether the customer has consented to be sent marketing material via email.
    var acceptsMarketing: GraphQLNullable<Bool> {
      get { __data["acceptsMarketing"] }
      set { __data["acceptsMarketing"] = newValue }
    }
  }

}