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

    func update(viewModel: HomeCollectionViewBannerViewModelCellProtocol) {
//        self.viewModel = viewModel
        bannerTitle.text = viewModel.configureTitle()
        bannerImageView.image = viewModel.configureImage()
    }

    private func setUpLayout() {
        contentView.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
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

protocol HomeCollectionViewBannerViewModelCellProtocol {
    func configureImage() -> UIImage
    func configureTitle() -> String
}

final class HomeCollectionViewBannerViewModelCell: HomeCollectionViewBannerViewModelCellProtocol {

    struct Data {
        let title: String
        let image: UIImage?
    }

    private let data: Data
    
    init(data: Data) {
        self.data = data
    }
    
    func configureImage() -> UIImage {
        data.image ?? UIImage()
    }

    func configureTitle() -> String {
        data.title.uppercased()
    }
}
