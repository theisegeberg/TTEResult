import Combine
import Foundation

extension Error {
  fileprivate func nestError<T>(in errorNest: (Error) -> T) -> T {
    guard let localType = self as? T else {
      return errorNest(self)
    }
    return localType
  }
}

extension Result {
  /// Nests an error in an underlying type. The mapping will only occur if the error is not alrady of the nesting type. Useful for error mapping where you don't want to loose the underlying error, but also you don't double wrapping.
  ///
  /// ```
  /// enum AnError:Error {
  ///   case knownError
  ///   case underlyingError(Error)
  /// }
  ///
  /// enum AnotherError:Error {
  ///   case aSpecificOtherError
  /// }
  ///
  /// print(
  ///   Result { throw AnError.knownError }
  ///     .nestError(in: AnError.underlyingError)
  /// )
  /// // AnError.knownError (not nested)
  ///
  /// print(
  ///   Result { throw AnotherError.aSpecificOtherError }
  ///     .nestError(in: AnError.underlyingError)
  /// )
  /// // AnError.underlyingError(AnotherError.aSpecificOtherError) (nested)
  ///
  /// ```
  /// - Parameter errorNest: The method that nests one error inside another, typically it's the case of en error enum. These are static initialisers.
  /// - Returns: A result where errors are mapped into nested errors.
  func nestError<T: Error>(in errorNest: (Error) -> T) -> Result<Success, T> {
    self.mapError {
      $0.nestError(in: errorNest)
    }
  }
}
