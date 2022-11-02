
import UIKit

class ViewController: UIViewController {
    
    let reachability = try! Reachability()
    private var employeesVM: EmployeesViewModel!
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Employee"
        setupView()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.reachability.whenReachable = { reachability in
                if reachability.connection == .wifi {
                    print("Reachable via WiFi")
                } else {
                    print("Reachable via Cellular")
                }
            }
            self.reachability.whenUnreachable = { _ in
                let alert = UIAlertController(title: "Oops...", message: "Network connection lost-_-", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                self.present(alert, animated: true)
            }
            
            do {
                try self.reachability.startNotifier()
            } catch {
                print("Unable to start notifier")
            }
        }
    }
    
    deinit {
        reachability.stopNotifier()
    }
    
    private func setup() {
        Webservice.shared.fetchData { Model in
            guard let employees = Model.company.employees else { return }
            self.employeesVM = EmployeesViewModel(employees: employees)
            self.employeesVM.employees = self.employeesVM.employees.sorted(by: { $0.name < $1.name })
            self.tableView.reloadData()
        }
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.employeesVM == nil ? 0 : self.employeesVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employeesVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EmployeeCell else { fatalError("no cell") }
        let employeeVM = self.employeesVM.employeeAtIndex(indexPath.row)
        cell.nameLabel.text = employeeVM.name
        cell.phoneNumberLabel.text = employeeVM.phoneNumber
        cell.skillsLabel.text = employeeVM.skills.joined(separator: " ")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

