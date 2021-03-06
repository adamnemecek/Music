//
//  BeatContext.swift
//  MusicModel
//
//  Created by James Bean on 8/26/17.
//

import Math
import MetricalDuration
import Tempo
import Meter

// TODO: Move to `dn-m/MetronomeController`
/// Information about a given beat within a `Meter`.
public struct BeatContext: Equatable {

    // MARK: - Instance Properties

    /// - Returns: Metrical offset from start of a `Meter.Structure`.
    public var metricalOffset: MetricalDuration {
        let rangeOffsetFraction = meterContext.meter.range.lowerBound
        let rangeOffset = rangeOffsetFraction.numerator /> rangeOffsetFraction.denominator
        return MetricalDuration(meterContext.offset.numerator, meterContext.offset.denominator) + offset - rangeOffset
    }

    /// Meter containing `BeatContext`.
    public let meterContext: Meter.Context

    /// Metrical offset of beat within `Meter`.
    public let offset: MetricalDuration

    // MARK: - Initializers

    /// Creates a `BeatContext` with the given `subdivision` and `position`.
    public init(
        meterContext: Meter.Context,
        offset: MetricalDuration,
        interpolation: Tempo.Interpolation
    )
    {
        self.meterContext = meterContext
        self.offset = offset
    }
}
