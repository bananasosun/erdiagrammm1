import Foundation
import CoreData

extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String?
    @NSManaged public var position: String?
    @NSManaged public var salary: Double
    @NSManaged public var registers: NSSet?
    @NSManaged public var responsibleFor: NSSet?

}

// MARK: Generated accessors for registers
extension Employee {

    @objc(addRegistersObject:)
    @NSManaged public func addToRegisters(_ value: Client)

    @objc(removeRegistersObject:)
    @NSManaged public func removeFromRegisters(_ value: Client)

    @objc(addRegisters:)
    @NSManaged public func addToRegisters(_ values: NSSet)

    @objc(removeRegisters:)
    @NSManaged public func removeFromRegisters(_ values: NSSet)

}

// MARK: Generated accessors for responsibleFor
extension Employee {

    @objc(addResponsibleForObject:)
    @NSManaged public func addToResponsibleFor(_ value: RentalObject)

    @objc(removeResponsibleForObject:)
    @NSManaged public func removeFromResponsibleFor(_ value: RentalObject)

    @objc(addResponsibleFor:)
    @NSManaged public func addToResponsibleFor(_ values: NSSet)

    @objc(removeResponsibleFor:)
    @NSManaged public func removeFromResponsibleFor(_ values: NSSet)

}
