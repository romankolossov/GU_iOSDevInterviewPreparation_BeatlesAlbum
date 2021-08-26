import Foundation

final class DetailInteractor {

    weak var output: DetailInteractorOutput?

    private let artistId: Int

    init(artistId: Int) {
        self.artistId = artistId
    }
}

extension DetailInteractor: DetailInteractorInput {

    func obtainDetails() {
        output?.presentDetails(for: getArtist())
    }
}

private func getArtist() -> Artist {
    Artist(
        identifier: 1111,
        name: "John Lennon",
        albums: [
            Artist.Album(
                name: "Imagine",
                songs: [
                    Artist.Song(name: "Imagine", duration: 180),
                    Artist.Song(name: "Crippled Inside", duration: 227),
                    Artist.Song(name: "Jealous Guy", duration: 254),
                    Artist.Song(name: "It's So Hard", duration: 205),
                    Artist.Song(name: "I Don't Want to Be a Soldier", duration: 365),
                    Artist.Song(name: "Gimme Some Truth", duration: 196),
                    Artist.Song(name: "Oh My Love", duration: 170),
                    Artist.Song(name: "How Do You Sleep?", duration: 336),
                    Artist.Song(name: "How?", duration: 223),
                    Artist.Song(name: "Oh Yoko!", duration: 260)
                ],
                date: Date(timeIntervalSince1970: 53222400)
            )
        ]
    )
}
