



import UIKit

class DetailViewController: UIViewController {
    

    var imageView: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    var stackView: UIStackView = {
        let sw = UIStackView()
        sw.translatesAutoresizingMaskIntoConstraints = false
        sw.axis = .vertical
        sw.distribution = .equalSpacing
        sw.spacing = 16
        return sw
    }()
    var titleLabel = UILabel()
    var overviewLabel = UILabel()
    
    
    var overview = ""
    var imageUrl = ""
    var navTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
        style()
        layout()
        title = navTitle
        print(overview)
    }
    func loadImage() {
        do {
            let data = try Data(contentsOf: URL(string:Api.mainImageUrl+imageUrl)!)
            DispatchQueue.main.async {
              
                self.imageView.image = UIImage(data: data)
            }
        }
        catch {
            print("Image Loading Error \(error)")
        }
    }
}
extension DetailViewController {
    func style() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.text = navTitle
        
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.font = UIFont.systemFont(ofSize: 16)
        overviewLabel.textAlignment = .left
        overviewLabel.numberOfLines = 0
        overviewLabel.text = overview
    
        
        
        
    }
    func layout() {
      
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(overviewLabel)
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 8),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -8),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])

        
        
        
    }
}
