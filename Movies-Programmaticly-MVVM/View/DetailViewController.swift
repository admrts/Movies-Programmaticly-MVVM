



import UIKit

class DetailViewController: UIViewController {
    

    var imageView: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    var titleLabel = UILabel()
    var overviewLabel = UILabel()
    
    var movieTitle = ""
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
      
       
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)

        NSLayoutConstraint.activate([
            // imageView
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16),
          imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1),
            imageView.widthAnchor.constraint(equalToConstant: view.bounds.width),

            
            // titleLabel
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16),
            
            //overviewLabel
            
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 8),
            overviewLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 8),
            overviewLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -8),
//            overviewLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        
        
        
    }
}
