import Foundation
import CoreData

class RequestViewModel: ObservableObject {
    @Published var requests: [Request] = []

    private var viewContext: NSManagedObjectContext

    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
        fetchRequests()
    }

    func fetchRequests() {
        let request: NSFetchRequest<Request> = Request.fetchRequest()
        do {
            requests = try viewContext.fetch(request)
        } catch {
            print("Failed to fetch requests: \(error)")
        }
    }

    func addRequest(description: String, date: Date) {
        let newRequest = Request(context: viewContext)
        newRequest.requestDescription = description
        newRequest.date = date
        saveContext()
        fetchRequests()
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

