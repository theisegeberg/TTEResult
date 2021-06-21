import Foundation

extension Result {

  /// Non-throwing getter for results with failure type `Never`
  /// - Returns: The inner value of the result.
  public func get() -> Success where Failure == Never {
    switch self {
    case .success(let success):
      return success
    default:
      fatalError("Attempted to get the failure of a Result type where Failure == Never")
    }
  }

}
