// @generated
// This file was automatically generated and should not be edited.

import Apollo

extension AppSchema {
  /// Possible error codes that can be returned by `CheckoutUserError`.
  enum CheckoutErrorCode: String, EnumType {
    /// The input value is blank.
    case blank = "BLANK"
    /// The input value is invalid.
    case invalid = "INVALID"
    /// The input value is too long.
    case tooLong = "TOO_LONG"
    /// The input value needs to be blank.
    case present = "PRESENT"
    /// The input value should be less than the maximum value allowed.
    case lessThan = "LESS_THAN"
    /// The input value should be greater than or equal to the minimum value allowed.
    case greaterThanOrEqualTo = "GREATER_THAN_OR_EQUAL_TO"
    /// The input value should be less than or equal to the maximum value allowed.
    case lessThanOrEqualTo = "LESS_THAN_OR_EQUAL_TO"
    /// Checkout is already completed.
    case alreadyCompleted = "ALREADY_COMPLETED"
    /// Checkout is locked.
    case locked = "LOCKED"
    /// Input value is not supported.
    case notSupported = "NOT_SUPPORTED"
    /// Input email contains an invalid domain name.
    case badDomain = "BAD_DOMAIN"
    /// Input Zip is invalid for country provided.
    case invalidForCountry = "INVALID_FOR_COUNTRY"
    /// Input Zip is invalid for country and province provided.
    case invalidForCountryAndProvince = "INVALID_FOR_COUNTRY_AND_PROVINCE"
    /// Invalid state in country.
    case invalidStateInCountry = "INVALID_STATE_IN_COUNTRY"
    /// Invalid province in country.
    case invalidProvinceInCountry = "INVALID_PROVINCE_IN_COUNTRY"
    /// Invalid region in country.
    case invalidRegionInCountry = "INVALID_REGION_IN_COUNTRY"
    /// Shipping rate expired.
    case shippingRateExpired = "SHIPPING_RATE_EXPIRED"
    /// Gift card cannot be applied to a checkout that contains a gift card.
    case giftCardUnusable = "GIFT_CARD_UNUSABLE"
    /// Gift card is disabled.
    case giftCardDisabled = "GIFT_CARD_DISABLED"
    /// Gift card code is invalid.
    case giftCardCodeInvalid = "GIFT_CARD_CODE_INVALID"
    /// Gift card has already been applied.
    case giftCardAlreadyApplied = "GIFT_CARD_ALREADY_APPLIED"
    /// Gift card currency does not match checkout currency.
    case giftCardCurrencyMismatch = "GIFT_CARD_CURRENCY_MISMATCH"
    /// Gift card is expired.
    case giftCardExpired = "GIFT_CARD_EXPIRED"
    /// Gift card has no funds left.
    case giftCardDepleted = "GIFT_CARD_DEPLETED"
    /// Gift card was not found.
    case giftCardNotFound = "GIFT_CARD_NOT_FOUND"
    /// Cart does not meet discount requirements notice.
    case cartDoesNotMeetDiscountRequirementsNotice = "CART_DOES_NOT_MEET_DISCOUNT_REQUIREMENTS_NOTICE"
    /// Discount expired.
    case discountExpired = "DISCOUNT_EXPIRED"
    /// Discount disabled.
    case discountDisabled = "DISCOUNT_DISABLED"
    /// Discount limit reached.
    case discountLimitReached = "DISCOUNT_LIMIT_REACHED"
    /// Higher value discount applied.
    case higherValueDiscountApplied = "HIGHER_VALUE_DISCOUNT_APPLIED"
    /// Maximum number of discount codes limit reached.
    case maximumDiscountCodeLimitReached = "MAXIMUM_DISCOUNT_CODE_LIMIT_REACHED"
    /// Discount not found.
    case discountNotFound = "DISCOUNT_NOT_FOUND"
    /// Customer already used once per customer discount notice.
    case customerAlreadyUsedOncePerCustomerDiscountNotice = "CUSTOMER_ALREADY_USED_ONCE_PER_CUSTOMER_DISCOUNT_NOTICE"
    /// Discount code isn't working right now. Please contact us for help.
    case discountCodeApplicationFailed = "DISCOUNT_CODE_APPLICATION_FAILED"
    /// Checkout is already completed.
    case empty = "EMPTY"
    /// Not enough in stock.
    case notEnoughInStock = "NOT_ENOUGH_IN_STOCK"
    /// Missing payment input.
    case missingPaymentInput = "MISSING_PAYMENT_INPUT"
    /// The amount of the payment does not match the value to be paid.
    case totalPriceMismatch = "TOTAL_PRICE_MISMATCH"
    /// Line item was not found in checkout.
    case lineItemNotFound = "LINE_ITEM_NOT_FOUND"
    /// Unable to apply discount.
    case unableToApply = "UNABLE_TO_APPLY"
    /// Discount already applied.
    case discountAlreadyApplied = "DISCOUNT_ALREADY_APPLIED"
    /// Throttled during checkout.
    case throttledDuringCheckout = "THROTTLED_DURING_CHECKOUT"
    /// Queue token has expired.
    case expiredQueueToken = "EXPIRED_QUEUE_TOKEN"
    /// Queue token is invalid.
    case invalidQueueToken = "INVALID_QUEUE_TOKEN"
    /// Cannot specify country and presentment currency code.
    case invalidCountryAndCurrency = "INVALID_COUNTRY_AND_CURRENCY"
    /// Product is not published for this customer.
    case productNotAvailable = "PRODUCT_NOT_AVAILABLE"
  }

}