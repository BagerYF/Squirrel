// @generated
// This file was automatically generated and should not be edited.

import Apollo

extension AppSchema {
  /// The input fields for a filter used to view a subset of products in a collection matching a specific variant option.
  struct VariantOptionFilter: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      name: String,
      value: String
    ) {
      __data = InputDict([
        "name": name,
        "value": value
      ])
    }

    /// The name of the variant option to filter on.
    var name: String {
      get { __data["name"] }
      set { __data["name"] = newValue }
    }

    /// The value of the variant option to filter on.
    var value: String {
      get { __data["value"] }
      set { __data["value"] = newValue }
    }
  }

}