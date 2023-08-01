public struct Polygon: Hashable, Sendable {
    public var exterior: LinearRing
    public var holes: [LinearRing]

    public init(exterior: LinearRing, holes: [LinearRing] = []) {
        self.exterior = exterior
        self.holes = holes
    }

    public struct LinearRing: Hashable, Sendable {
        public static var isValidationOn: Bool = true
        
        public let points: [Point]

        public init(points: [Point]) throws {
            if Self.isValidationOn {
                guard points.count >= 4 else {
                    throw GEOSwiftError.tooFewPoints
                }
                guard points.first == points.last else {
                    throw GEOSwiftError.ringNotClosed
                }
            }
            self.points = points
        }
    }
}
