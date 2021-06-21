import Foundation

extension Result {
  /// Replaces nil vlue in result with an error.
  /// - Parameter withError: The error to replace nil values with.
  /// - Returns: A new non-optional result
  func replaceNil<T>(withError: Failure) -> Result<T, Failure> where Success == T? {
    switch self {
    case .success(let optional):
      guard let unwrapped = optional else {
        return .failure(withError)
      }
      return .success(unwrapped)
    case .failure(let error):
      return .failure(error)
    }
  }
}
