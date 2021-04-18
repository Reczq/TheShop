import UIKit

final class HomeCollectionViewCarouselCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("CustomCollectionViewCell doesn't support Interface Builder")
    }
    
    private func setUpLayout() {
        contentView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
    }
}
