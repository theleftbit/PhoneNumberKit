@testable import PhoneNumberKit
import XCTest

final class MetadataResourceTests: XCTestCase {
    func testDefaultMetadataResourceParsesInternationalNumbers() throws {
        let metadata = try XCTUnwrap(PhoneNumberUtility.defaultMetadataCallback())
        let utility = PhoneNumberUtility(metadataCallback: { metadata })

        XCTAssertEqual(try utility.parse("+34 722 447 302").nationalNumber, 722447302)
        XCTAssertEqual(try utility.parse("+1 202-555-0125").nationalNumber, 2025550125)
        XCTAssertEqual(try utility.parse("+55 (11) 91234-5678").nationalNumber, 11912345678)
    }
}
