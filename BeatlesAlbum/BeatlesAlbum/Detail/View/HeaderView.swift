import UIKit

final class HeaderView: UIView {

    private let titleLabel = UILabel()
    private let dateLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func apply(title: String, date: String) {
        titleLabel.text = title
        dateLabel.text = date
        setNeedsDisplay()
    }
}

// MARK: - Configuration

private extension HeaderView {

    func configure() {
        configureTitleLabel()
        configureDateLabel()
        constrainContents()
    }

    func configureTitleLabel() {
        addSubview(titleLabel)
        titleLabel.font = .titleLabelFont
        titleLabel.textColor = .titleLabelTextColor
        titleLabel.textAlignment = .natural
    }

    func configureDateLabel() {
        addSubview(dateLabel)
        dateLabel.font = .dateLabelFont
        dateLabel.textColor = .dateLabelTextColor
        dateLabel.textAlignment = .right
    }
}

// MARK: - Layout

private extension HeaderView {

    enum Layout {
        static let interelement: CGFloat = .interelement
    }

    func constrainContents() {
        constrainTitleLabel()
        constrainDateLabel()
    }

    func constrainTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: Layout.interelement).isActive = true
        titleLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
    }

    func constrainDateLabel() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false

        dateLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: Layout.interelement).isActive = true
        dateLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        dateLabel.topAnchor.constraint(greaterThanOrEqualTo: topAnchor).isActive = true
        dateLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
        dateLabel.setContentHuggingPriority(.required, for: .horizontal)
    }
}
