import Foundation

extension Result {

  /// Replaces the error with another value
  /// - Parameter f: The closure replacing the error.
  /// - Returns: A new result with error type Never
  func replaceError(with f: (Failure) -> Success) -> Result<Success, Never> {
    switch self {
    case .success(let success):
      return .success(success)
    case .failure(let error):
      return .success(f(error))
    }
  }
}
