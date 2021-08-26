import Foundation

final class DetailPresenter {

  weak var view: DetailViewInput?
  var interactor: DetailInteractorInput?

  private lazy var dateFormatter: DateFormatter = createDateFormatter()
}

extension DetailPresenter: DetailViewOutput {

  func viewIsReady() {
    interactor?.obtainDetails()
  }
}

extension DetailPresenter: DetailRouterOutput {}

extension DetailPresenter: DetailInteractorOutput {

  func presentDetails(for artist: Artist) {
    let viewModel = transform(model: artist)
    view?.upadateDetails(viewModel)
  }
}

private extension DetailPresenter {

  func createDateFormatter() -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM YYYY"
    return formatter
  }

  func transform(model: Artist) -> DetailViewModel {
    return DetailViewModel(
      artistName: model.name,
      artistAlbums: model.albums.map { transform(album: $0) }
    )
  }

  func transform(album: Artist.Album) -> DetailViewModel.Album {
    return DetailViewModel.Album(
      title: album.name.uppercased(),
      songList: album.songs.map { transform(song: $0) },
      date: dateFormatter.string(from: album.date)
    )
  }

  func transform(song: Artist.Song) -> DetailViewModel.Album.Song {

    return DetailViewModel.Album.Song(
      name: song.name,
      duration: format(duration: song.duration)
    )
  }

  func format(duration: Double) -> String {
    let minutes = Int(floor(duration / 60))
    let seconds = Int(duration) % 60
    var secondsValue = "00"
    if seconds < 10 && seconds > 0 {
      secondsValue = "0\(seconds)"
    } else if seconds > 10 {
      secondsValue = "\(seconds)"
    }
    return "\(minutes):\(secondsValue)"
  }
}
