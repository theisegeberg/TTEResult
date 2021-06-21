import Foundation

extension Result {

  /// Where a results success value is a function of (A) -> B, then this takes an A, and applies the function and returns a success of B
  /// - Parameter a: Generic value, the input of the function of the result function.
  /// - Returns: A result where the original value of a function has been turned into the result of that function.
  func injectValue<A, B>(_ a: A) -> Result<B, Failure> where Success == (A) -> B {
    switch self {
    case .success(let f):
      return .success(f(a))
    case .failure(let error):
      return .failure(error)
    }
  }
}
