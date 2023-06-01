import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var movies = [Movie]()
    private var selectedMovie: Movie?
    
    private let loadingIndicatorView = UIView()
    private let activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    var presenter: ViewToPresenterMainProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
        setupSearchBar()
        setupLoadingIndicator()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Movie Search"
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = true
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    private func setupLoadingIndicator() {
        loadingIndicatorView.frame = view.frame
        loadingIndicatorView.backgroundColor = .darkGray
        loadingIndicatorView.alpha = 0.4
        loadingIndicatorView.isHidden = true
        
        activityIndicatorView.center = CGPoint(
            x: UIScreen.main.bounds.size.width / 2,
            y: UIScreen.main.bounds.size.height / 2
        )
        activityIndicatorView.color = .white
        activityIndicatorView.hidesWhenStopped = true
        
        loadingIndicatorView.addSubview(activityIndicatorView)
        view.addSubview(loadingIndicatorView)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "movieDetail"{
                let nextPage = segue.destination as! DetailViewController
                nextPage.movie = selectedMovie!
            }
        }
}

extension MainViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            movies.removeAll()
            tableView.reloadData()
            tableView.isHidden = true
            searchBar.resignFirstResponder()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        
        activityIndicatorView.startAnimating()
        loadingIndicatorView.isHidden = false
        presenter?.getMovie(movie: text)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = movies[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentCell = tableView.cellForRow(at: indexPath)!
        selectedMovie = movies[indexPath.row]
        performSegue(withIdentifier: "movieDetail", sender: nil)
        currentCell.setSelected(false, animated: true)
    }
}

extension MainViewController: PresenterToViewMainProtocol {
    
    func loadMovie(movie: Movie) {
        activityIndicatorView.stopAnimating()
        loadingIndicatorView.isHidden = true
        tableView.isHidden = false
        
        movies.removeAll()
        movies.append(movie)
        tableView.reloadData()
    }
    
    func showAlert() {
        activityIndicatorView.stopAnimating()
        loadingIndicatorView.isHidden = true
        
        let alertController = UIAlertController(title: "Invalid Search", message: "Please search another movie", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
