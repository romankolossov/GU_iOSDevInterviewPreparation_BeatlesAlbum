import Foundation

struct DetailViewModel {

  let artistName: String

  let artistAlbums: [Album]
}

extension DetailViewModel {

  struct Album {

    let title: String
    let songList: [Song]
    let date: String
  }
}

extension DetailViewModel.Album {

  struct Song {

    let name: String
    let duration: String
  }
}
