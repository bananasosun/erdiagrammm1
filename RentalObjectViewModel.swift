import Foundation
import CoreData

class RentalObjectViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var type: String = ""
    @Published var location: String = ""
    @Published var rentalObjects: [RentalObject] = []

    private var viewContext: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.viewContext = context
        fetchRentalObjects()
    }

    func fetchRentalObjects() {
        let request: NSFetchRequest<RentalObject> = RentalObject.fetchRequest()
        do {
            rentalObjects = try viewContext.fetch(request)
        } catch {
            print("Failed to fetch rental objects: \(error.localizedDescription)")
        }
    }

    func saveRentalObject() {
        let newRentalObject = RentalObject(context: viewContext)
        newRentalObject.name = name
        newRentalObject.type = type
        newRentalObject.location = location

        do {
            try viewContext.save()
            fetchRentalObjects()
        } catch {
            print("Failed to save rental object: \(error.localizedDescription)")
        }
    }
}
