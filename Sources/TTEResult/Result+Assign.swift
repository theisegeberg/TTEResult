import Foundation

extension Result {
  /// Assignss the success of a result to a vlue
  /// - Parameters:
  ///   - to: The keypath to which the value will be assigned
  ///   - on: The object whereon the value will be set
  func assign<Root>(to: ReferenceWritableKeyPath<Root, Success>, on: Root) where Failure == Never {
    switch self {
    case .failure:
      fatalError()
    case .success(let success):
      on[keyPath: to] = success
    }
  }
}
