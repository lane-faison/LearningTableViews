import UIKit

class ActionButtonsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Food] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        
        for item in FruitsNVeggies.FoodItems() {
            data.append(contentsOf: item.foodItems)
        }
        
    }
}

extension ActionButtonsTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        let food = data[indexPath.row]
        cell.textLabel?.text = food.title
        cell.detailTextLabel?.text = food.subtitle
        cell.imageView?.image = food.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let archiveAction = UIContextualAction(style: .normal, title: "Archive") { (action, view, _) in
            print("User selected Archive")
        }
        let saveAction = UIContextualAction(style: .normal, title: "Save") { (action, view, _) in
            print("User selected Save")
        }
        archiveAction.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        saveAction.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        archiveAction.image = #imageLiteral(resourceName: "archive")
        saveAction.image = #imageLiteral(resourceName: "save")
        
        let config = UISwipeActionsConfiguration(actions: [archiveAction, saveAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let infoAction = UIContextualAction(style: .normal, title: "Info") { (action, view, _) in
            print("User selected Info")
        }
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, _) in
            print("User selected Delete")
        }
        infoAction.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        deleteAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        infoAction.image = #imageLiteral(resourceName: "info")
        deleteAction.image = #imageLiteral(resourceName: "delete")
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction, infoAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
}
