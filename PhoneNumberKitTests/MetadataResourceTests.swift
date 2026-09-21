@testable import PhoneNumberKit
import Testing

struct MetadataResourceTests {
    @Test
    func defaultMetadataResourceParsesInternationalNumbers() throws {
        let metadata = try #require(try PhoneNumberUtility.defaultMetadataCallback())
        let utility = PhoneNumberUtility(metadataCallback: { metadata })

        #expect(try utility.parse("+34 722 447 302").nationalNumber == 722447302)
        #expect(try utility.parse("+1 202-555-0125").nationalNumber == 2025550125)
        #expect(try utility.parse("+55 (11) 91234-5678").nationalNumber == 11912345678)
    }
}
