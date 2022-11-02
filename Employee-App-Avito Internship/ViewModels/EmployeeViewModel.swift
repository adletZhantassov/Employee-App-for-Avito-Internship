//
//  EmployeeViewModel.swift
//  Employee-App-Avito Internship
//
//  Created by Adlet Zhantassov on 02.11.2022.
//

import Foundation

struct EmployeesViewModel {
    var employees: [Employee]
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.employees.count
    }
    
    func employeeAtIndex(_ index: Int) -> EmployeeViewModel {
        let employee = self.employees[index]
        return EmployeeViewModel(employee)
    }
}

struct EmployeeViewModel {
    private let employee: Employee
}

extension EmployeeViewModel {
    init(_ employee: Employee) {
        self.employee = employee
    }
    var name: String {
        return self.employee.name
    }
    var phoneNumber: String {
        return self.employee.phone_number
    }
    var skills: [String] {
        return self.employee.skills
    }
}
