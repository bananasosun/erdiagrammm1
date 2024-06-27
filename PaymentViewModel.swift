import Foundation
import CoreData

class PaymentViewModel: ObservableObject {
    @Published var payments: [Payment] = []

    private var viewContext: NSManagedObjectContext

    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
        fetchPayments()
    }

    func fetchPayments() {
        let request: NSFetchRequest<Payment> = Payment.fetchRequest()
        do {
            payments = try viewContext.fetch(request)
        } catch {
            print("Failed to fetch payments: \(error)")
        }
    }

    func addPayment(amount: Double, date: Date) {
        let newPayment = Payment(context: viewContext)
        newPayment.amount = amount
        newPayment.date = date
        saveContext()
        fetchPayments()
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
