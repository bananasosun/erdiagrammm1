import Foundation
import CoreData

extension Client {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Client> {
        return NSFetchRequest<Client>(entityName: "Client")
    }

    @NSManaged public var name: String?
    @NSManaged public var views: NSSet?

}

// MARK: Generated accessors for views
extension Client {

    @objc(addViewsObject:)
    @NSManaged public func addToViews(_ value: RentalObject)

    @objc(removeViewsObject:)
    @NSManaged public func removeFromViews(_ value: RentalObject)

    @objc(addViews:)
    @NSManaged public func addToViews(_ values: NSSet)

    @objc(removeViews:)
    @NSManaged public func removeFromViews(_ values: NSSet)

}
