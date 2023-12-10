import UIKit
import Kingfisher

class EverythingCell: UITableViewCell {
    
    let newsimageView = UIImageView()
    let scrollView = UIScrollView()
    let titleLabel = UILabel()
    
    public var item : Article! {
        didSet{
            titleLabel.text = item.title
            let imageurl = URL(string: item.urlToImage ?? "https://picsum.photos/200")
            newsimageView.kf.setImage(with: imageurl)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let cellHeight = contentView.bounds.height
        let cellWidth = contentView.bounds.width
        
        contentView.backgroundColor = .white
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping

        newsimageView.sizeToFit()
        scrollView.addSubview(titleLabel)
        contentView.addSubViews(newsimageView,scrollView)
        newsimageView.anchor(top: contentView.safeAreaLayoutGuide.topAnchor,left: contentView.safeAreaLayoutGuide.leadingAnchor,paddingTop: cellHeight * 0.05,paddingLeft: cellWidth * 0.1,width: contentView.safeAreaLayoutGuide.widthAnchor, height: contentView.safeAreaLayoutGuide.heightAnchor,widthMultiplier: 0.25, heightMultiplier: 0.8)
        scrollView.anchor(top:contentView.safeAreaLayoutGuide.topAnchor,left: newsimageView.trailingAnchor,paddingTop: cellHeight * 0.05,paddingLeft: cellWidth * 0.1,centerY: newsimageView.centerYAnchor,
                          width: contentView.safeAreaLayoutGuide.widthAnchor, height: contentView.safeAreaLayoutGuide.heightAnchor,widthMultiplier: 0.6, heightMultiplier: 0.8)
        titleLabel.anchor(top: scrollView.topAnchor,left: scrollView.leadingAnchor,bottom: scrollView.bottomAnchor,right: scrollView.trailingAnchor,centerY: scrollView.centerYAnchor)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
