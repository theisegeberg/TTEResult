import Foundation

extension Result {

  @discardableResult
  func sink(_ f: (Success) -> Void) -> Result<Void, Failure> {
    switch self {
    case .success(let success):
      f(success)
      return .success(())
    case .failure(let error):
      return .failure(error)
    }
  }

}
