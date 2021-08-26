import UIKit

struct DetailAssembly {

  static func assemble(artistId: Int) -> UIViewController {
    let view = DetailViewController()
    let presenter = DetailPresenter()
    let interactor = DetailInteractor(artistId: artistId)
    let router = DetailRouter()

    view.output = presenter
    view.router = router
    presenter.view = view
    presenter.interactor = interactor
    interactor.output = presenter

    return view
  }
}
