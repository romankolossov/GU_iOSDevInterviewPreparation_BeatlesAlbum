import UIKit

final class SongCell: UITableViewCell {

    private let playButton = UIButton()
    private let titleLabel = UILabel()
    private let durationLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func applyViewModel(_ viewModel: DetailViewModel.Album.Song) {
        titleLabel.text = viewModel.name
        durationLabel.text = viewModel.duration
        setNeedsDisplay()
    }
}

// MARK: - Configuration

private extension SongCell {

    func configure() {
        configurePlayButton()
        configureTitleLabel()
        configureDurationLabel()
        constrainContents()
    }

    func configurePlayButton() {
        contentView.addSubview(playButton)
        playButton.setTitle("▶︎", for: .normal)
        playButton.setTitleColor(UIColor.playButtonTitleColorForNormal, for: .normal)
        playButton.setTitleColor(UIColor.playButtonTitleColorForSelected, for: .selected)
    }

    func configureTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.font = .songCellTitleLabelFont
        titleLabel.textColor = .songCellTitleLabelTextColor
        titleLabel.textAlignment = .natural
    }

    func configureDurationLabel() {
        contentView.addSubview(durationLabel)
        durationLabel.font = .durationLabelFont
        durationLabel.textColor = .durationLabelTextColor
        durationLabel.textAlignment = .right
    }
}

// MARK: - Layout

private extension SongCell {

    enum Layout {
        static let interelement: CGFloat = .interelement
    }

    func constrainContents() {
        constrainPlayButton()
        constrainTitleLabel()
        constrainDurationLabel()
    }

    func constrainPlayButton() {
        playButton.translatesAutoresizingMaskIntoConstraints = false

        playButton.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        playButton.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        playButton.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true
        playButton.setContentHuggingPriority(.required, for: .horizontal)

    }

    func constrainTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: Layout.interelement).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        titleLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor).isActive = true
    }

    func constrainDurationLabel() {
        durationLabel.translatesAutoresizingMaskIntoConstraints = false

        durationLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: Layout.interelement).isActive = true
        durationLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        durationLabel.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor).isActive = true
        durationLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor).isActive = true
        durationLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        durationLabel.setContentHuggingPriority(.required, for: .horizontal)
    }
}
