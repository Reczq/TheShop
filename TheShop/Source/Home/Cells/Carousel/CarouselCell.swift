import UIKit


final class CarouselCell: UICollectionViewCell {
    
    private let carouselCellTitle: UILabel = {
        let title: UILabel = UILabel()
        title.textColor = .yellow
        title.text = "failed"
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private let carouselCellImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 35
        imageView.image = UIImage()
        return imageView
    }()
    
    func update(title: String,
                image: UIImage) {
        carouselCellTitle.text = title
        carouselCellImage.image = image
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLayout() {
        contentView.addSubview(carouselCellImage)
        contentView.addSubview(carouselCellTitle)

        NSLayoutConstraint.activate([
            carouselCellImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            carouselCellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
            carouselCellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            carouselCellImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -25)
        ])

        NSLayoutConstraint.activate([
            carouselCellTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,constant: 35),
            carouselCellTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
