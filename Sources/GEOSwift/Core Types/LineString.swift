public struct LineString: Hashable, Sendable {
    public static var isValidationOn: Bool = true
    
    public let points: [Point]

    public var firstPoint: Point {
        points[0]
    }

    public var lastPoint: Point {
        points.last!
    }

    public init(points: [Point]) throws {
        if Self.isValidationOn {
            guard points.count >= 2 else {
                throw GEOSwiftError.tooFewPoints
            }
        }
        self.points = points
    }

    public init(_ linearRing: Polygon.LinearRing) {
        // No checks needed because LinearRing's invariants are more strict than LineString's
        self.points = linearRing.points
    }
}
