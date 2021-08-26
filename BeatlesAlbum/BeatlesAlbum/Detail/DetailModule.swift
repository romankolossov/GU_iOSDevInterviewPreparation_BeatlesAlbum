import Foundation

// MARK: - Module I/O

public protocol DetailModuleInput {}

public protocol DetailModuleOutput {}

// MARK: - Module Components

protocol DetailViewInput: class {

  func upadateDetails(_ details: DetailViewModel)
}

protocol DetailViewOutput {

  func viewIsReady()
}

protocol DetailInteractorInput {

  func obtainDetails()
}

protocol DetailInteractorOutput: class {

  func presentDetails(for artist: Artist)
}

protocol DetailRouterInput {}
protocol DetailRouterOutput: class {}
