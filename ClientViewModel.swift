import Foundation
import CoreData

class ClientViewModel: ObservableObject {
    @Published var clients: [Client] = []

    private var viewContext: NSManagedObjectContext

    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
        fetchClients()
    }

    func fetchClients() {
        let request: NSFetchRequest<Client> = Client.fetchRequest()
        do {
            clients = try viewContext.fetch(request)
        } catch {
            print("Failed to fetch clients: \(error)")
        }
    }

    func addClient(name: String, contactInfo: String) {
        let newClient = Client(context: viewContext)
        newClient.name = name
        newClient.contactInfo = contactInfo
        saveContext()
        fetchClients()
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
