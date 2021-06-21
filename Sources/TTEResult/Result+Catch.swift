import Foundation

// I got this code from somewhere, but honestly I don't remember where 🤷‍♂️
extension Result {

  /**
	```
	let result: Int = Result {
		try doThisFirst()
	}.catch {
		try doThisIfFirstFails()
	}.catch {
		try doThisIfSecondFails()
	}.get(default: 42)
	```
	*/
  public func `catch`(_ handler: () throws -> Success) -> Result<Success, Error> {
    flatMapError { _ in
      .init { try handler() }
    }
  }

  /**
	```
	let result: Int = Result {
		try doThisFirst()
	}.catch {
		try doThisIfFirstFails()
	}.catch {
		try doThisIfSecondFails()
	}.get(default: 42)
	```
	*/
  public func `catch`(_ handler: (Failure) throws -> Success) -> Result<Success, Error> {
    flatMapError { error in
      .init { try handler(error) }
    }
  }

  /**
	```
	let result: Int = Result {
		try doThisFirst()
	}.catch {
		try doThisIfFirstFails()
	}.catch {
		try doThisIfSecondFails()
	}.get(default: 42)
	```
	*/
  public func get(default defaultValue: @autoclosure () -> Success) -> Success {
    self.default(defaultValue)
  }

  /**
	```
	let result: Int = Result {
		try doThisFirst()
	}.catch {
		try doThisIfFirstFails()
	}.catch {
		try doThisIfSecondFails()
	}.get(default: 42)
	```
	*/
  public func `default`(_ handler: () -> Success) -> Success {
    self.default { _ in handler() }
  }

  /**
	```
	let result: Int = Result {
		try doThisFirst()
	}.catch {
		try doThisIfFirstFails()
	}.catch {
		try doThisIfSecondFails()
	}.get(default: 42)
	```
	*/
  public func `default`(_ handler: (Failure) -> Success) -> Success {
    switch self {
    case .success(let success):
      return success
    case .failure(let error):
      return handler(error)
    }
  }
}
