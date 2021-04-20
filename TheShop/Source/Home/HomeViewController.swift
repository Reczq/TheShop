import UIKit

final class HomeViewController: UIViewController {

    enum ItemType {
        case banner(HomeCollectionViewBannerViewModelCellProtocol)
        case carousel(HomeCollectionViewCarouselViewModelCellProtocol)
    }

    private let modules: [ItemType] = [
        .banner(HomeCollectionViewBannerViewModelCell(data: HomeCollectionViewBannerViewModelCell.Data(title: "testTitle-1",image: UIImage(named: "testAvatar")))),
        .carousel(
            HomeCollectionViewCarouselViewModelCell(
                data: [
                    HomeCollectionViewCarouselViewModelCell.Data(title: "test-title",
                                                                 image: UIImage(named: "testAvatar")),
                    HomeCollectionViewCarouselViewModelCell.Data(title: "test-title",
                                                                 image: UIImage(named: "testAvatar")),
                    HomeCollectionViewCarouselViewModelCell.Data(title: "test-title",
                                                                 image: UIImage(named: "testAvatar")),
                    HomeCollectionViewCarouselViewModelCell.Data(title: "test-title",
                                                                 image: UIImage(named: "testAvatar")),
                    HomeCollectionViewCarouselViewModelCell.Data(title: "test-title",
                                                                 image: UIImage(named: "testAvatar")),
                    HomeCollectionViewCarouselViewModelCell.Data(title: "test-title",
                                                                 image: UIImage(named: "testAvatar")),
                    HomeCollectionViewCarouselViewModelCell.Data(title: "test-title",
                                                                 image: UIImage(named: "testAvatar")),
                    HomeCollectionViewCarouselViewModelCell.Data(title: "test-title",
                                                                 image: UIImage(named: "testAvatar"))
                ]
            )
        )
    ]
    
    private lazy var homeFlowLayout: UICollectionViewFlowLayout = {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        return flowLayout
    }()
    
    private lazy var homeCollectionView: UICollectionView = {
        let collectionView: UICollectionView = UICollectionView(frame: .zero,
                                                                collectionViewLayout: homeFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(HomeCollectionViewBannerCell.self,
                                forCellWithReuseIdentifier: "HomeCollectionViewBannerCell")
        collectionView.register(HomeCollectionViewCarouselCell.self,
                                forCellWithReuseIdentifier: "HomeCollectionViewCarouselCell")
        return collectionView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: HomeViewController) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        homeCollectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func setUpLayout() {
        view.addSubview(homeCollectionView)
        NSLayoutConstraint.activate([
            homeCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            homeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modules.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let module = modules[indexPath.item]
        
        switch module {
        case .banner(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeCollectionViewBannerCell.self), for: indexPath) as? HomeCollectionViewBannerCell else { return UICollectionViewCell() }
            cell.update(viewModel: viewModel)
            return cell
        case .carousel(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeCollectionViewCarouselCell.self), for: indexPath) as? HomeCollectionViewCarouselCell else { return UICollectionViewCell() }
            cell.update(viewModel: viewModel)
            return cell
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Clicked in \(indexPath)")
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let module = modules[indexPath.item]
        let homeCollectionViewWidth = homeCollectionView.frame.width
        
        switch module {
        case .banner:
            return CGSize(width: homeCollectionViewWidth, height: 120.0)
        case .carousel:
            return CGSize(width: homeCollectionViewWidth, height: 100.0)
        }
    }
}
