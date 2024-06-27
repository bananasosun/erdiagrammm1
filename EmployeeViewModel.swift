import Foundation
import CoreData

class EmployeeViewModel: ObservableObject {
    @Published var employees: [Employee] = []

    private var viewContext: NSManagedObjectContext

    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
        fetchEmployees()
    }

    func fetchEmployees() {
        let request: NSFetchRequest<Employee> = Employee.fetchRequest()
        do {
            employees = try viewContext.fetch(request)
        } catch {
            print("Failed to fetch employees: \(error)")
        }
    }

    func addEmployee(name: String, position: String) {
        let newEmployee = Employee(context: viewContext)
        newEmployee.name = name
        newEmployee.position = position
        saveContext()
        fetchEmployees()
    }

    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
