import Foundation
import CoreData

class OwnerViewModel: ObservableObject {
    @Published var owners: [Owner] = []

    private var viewContext: NSManagedObjectContext

    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
        fetchOwners()
    }

    func fetchOwners() {
        let request: NSFetchRequest<Owner> = Owner.fetchRequest()
        do {
            owners = try viewContext.fetch(request)
        } catch {
            print("Failed to fetch owners: \(error)")
        }
    }

    func addOwner(name: String, contactInfo: String) {
        let newOwner = Owner(context: viewContext)
        newOwner.name = name
        newOwner.contactInfo = contactInfo
        saveContext()
        fetchOwners()
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

