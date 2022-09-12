



import UIKit

class DetailViewController: UIViewController {
    

    var imageView: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
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
        
        
        
    }
    func layout() {
      
       
        view.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 24),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16),
          imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1),
            imageView.widthAnchor.constraint(equalToConstant: view.bounds.width),

        ])

        
        
        
    }
}
