// for internal use only; GeoJSON encoding & decoding helpers
extension Point: CodableGeometry {
    static let geoJSONType = GeoJSONType.point
    public static var isValidationOn: Bool = true

    var coordinates: [Double] {
        [x, y]
    }

    init(coordinates: [Double]) throws {
        if Self.isValidationOn {
            guard coordinates.count >= 2 else {
                throw GEOSwiftError.invalidCoordinates
            }
        }
        self.init(x: coordinates[0], y: coordinates[1])
    }
}
