import UIKit

final class HomeCollectionViewBannerCell: UICollectionViewCell {
    
//    private var viewModel: HomeCollectionViewBannerViewModelCellProtocol?
    
    private let bannerTitle: UILabel = {
        let banner: UILabel = UILabel()
        banner.textColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        banner.translatesAutoresizingMaskIntoConstraints = false
        return banner
    }()

    private let bannerImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("CustomCollectionViewCell doesn't support Interface Builder")
    }

    func update(viewModel: HomeCollectionViewBannerCellViewModelProtocol) {
//        self.viewModel = viewModel
        bannerTitle.text = viewModel.configureTitle()
        bannerImageView.image = viewModel.configureImage()
    }

    private func setUpLayout() {
        contentView.addSubview(bannerImageView)
        bannerImageView.addSubview(bannerTitle)

        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            bannerTitle.centerYAnchor.constraint(equalTo: bannerImageView.centerYAnchor),
            bannerTitle.centerXAnchor.constraint(equalTo: bannerImageView.centerXAnchor)
        ])
    }
}
