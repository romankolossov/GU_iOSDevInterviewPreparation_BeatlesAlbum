import Foundation

// MARK: - Module I/O

public protocol DetailModuleInput {}

public protocol DetailModuleOutput {}

// MARK: - Module Components

protocol DetailViewInput: AnyObject {

    func updateDetails(_ details: DetailViewModel)
}

protocol DetailViewOutput {

    func viewIsReady()
}

protocol DetailInteractorInput {

    func obtainDetails()
}

protocol DetailInteractorOutput: AnyObject {

    func presentDetails(for artist: Artist)
}

protocol DetailRouterInput {}
protocol DetailRouterOutput: AnyObject {}
