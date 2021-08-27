import UIKit

final class DetailViewController: UIViewController {

    var output: DetailViewOutput?
    var router: DetailRouterInput?
    private let tableView = UITableView(frame: .zero, style: .grouped)

    private var tableContents: DetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        output?.viewIsReady()
    }
}

extension DetailViewController: DetailViewInput {

    func upadateDetails(_ details: DetailViewModel) {
        title = details.artistName
        tableContents = details
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource Implementation

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        tableContents?.artistAlbums.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let contents = tableContents,
              contents.artistAlbums.count > section else { return 0 }
        return contents.artistAlbums[section].songList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configuration.cellIdentifier, for: indexPath)
        guard let songCell = cell as? SongCell,
              let contents = tableContents,
              contents.artistAlbums[indexPath.section].songList.count > indexPath.row else { return cell }
        let viewModel = contents.artistAlbums[indexPath.section].songList[indexPath.row]
        songCell.applyViewModel(viewModel)

        return songCell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView()
        guard let contents = tableContents,
              contents.artistAlbums.count > section else { return headerView }
        let viewModel = contents.artistAlbums[section]
        headerView.apply(title: viewModel.title, date: viewModel.date)
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        .heightForHeaderInSection
    }
}

// MARK: - Configuration

private extension DetailViewController {

    enum Configuration {
        static let cellIdentifier = "com.song.cell"
    }

    func configureUI() {
        view.backgroundColor = .detailViewBackgroundColor
        view.addSubview(tableView)
        configureTableView()
        constrainContents()
    }

    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SongCell.self, forCellReuseIdentifier: Configuration.cellIdentifier)
    }
}

// MARK: - Layout

private extension DetailViewController {

    func constrainContents() {
        tableView.translatesAutoresizingMaskIntoConstraints = false

        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
}
