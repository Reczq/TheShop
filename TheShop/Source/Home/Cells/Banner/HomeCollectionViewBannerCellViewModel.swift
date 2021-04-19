import UIKit

protocol HomeCollectionViewBannerCellViewModelProtocol {
    func configureImage() -> UIImage
    func configureTitle() -> String
}

final class HomeCollectionViewBannerCellViewModel: HomeCollectionViewBannerCellViewModelProtocol {

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
