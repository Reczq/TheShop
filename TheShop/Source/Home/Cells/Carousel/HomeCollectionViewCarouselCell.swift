import UIKit

final class HomeCollectionViewCarouselCell: UICollectionViewCell {
    
    private var viewModel: HomeCollectionViewCarouselViewModelCellProtocol?
    
    private lazy var carouselCollectionView: UICollectionView = {
            let collectionView: UICollectionView = UICollectionView(frame: .zero,
                                                                    collectionViewLayout: carouselFlowLayout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.backgroundColor = .clear
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.register(CarouselCell.self,
                                    forCellWithReuseIdentifier: "CarouselCell")
            return collectionView
        }()
    
    private lazy var carouselFlowLayout: UICollectionViewFlowLayout = {
            let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 5
            return flowLayout
        }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("CustomCollectionViewCell doesn't support Interface Builder")
    }
    
    func update(viewModel: HomeCollectionViewCarouselViewModelCellProtocol) {
        self.viewModel = viewModel
    }
   
    private func setUpLayout() {
        contentView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        contentView.addSubview(carouselCollectionView)
        NSLayoutConstraint.activate([
            carouselCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            carouselCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            carouselCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            carouselCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension HomeCollectionViewCarouselCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
}

extension HomeCollectionViewCarouselCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Clicked in \(indexPath)")
    }
}

extension HomeCollectionViewCarouselCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CarouselCell.self), for: indexPath) as? CarouselCell else { return UICollectionViewCell() }
        guard let viewModel = viewModel else { return UICollectionViewCell() }
        cell.update(title: viewModel.configureTitle(index: indexPath.item),
                    image: viewModel.configureImage(index: indexPath.item))
        return cell
    }
}

protocol HomeCollectionViewCarouselViewModelCellProtocol {
    func configureImage(index: Int) -> UIImage
    func configureTitle(index: Int) -> String
    var count: Int { get }
}

final class HomeCollectionViewCarouselViewModelCell: HomeCollectionViewCarouselViewModelCellProtocol {

    struct Data {
        let title: String
        let image: UIImage?
    }
    
    private let data: [Data]
    
    init(data: [Data]) {
        self.data = data
    }
    
    var count: Int {
        data.count
    }
    
    func configureImage(index: Int) -> UIImage {
        data[index].image ?? UIImage()
    }

    func configureTitle(index: Int) -> String {
        data[index].title.uppercased()
    }
}
