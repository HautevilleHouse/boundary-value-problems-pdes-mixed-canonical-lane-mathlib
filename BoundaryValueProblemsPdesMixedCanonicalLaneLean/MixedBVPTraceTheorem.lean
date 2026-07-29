import BoundaryValueProblemsPdesMixedCanonicalLaneLean.ParabolicEvolution

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure MixedBVPTraceTheoremPackage {S : MixedBVPSobolevSpacePackage}
    {E : EllipticRegularityPackage S} {P : ParabolicEvolutionPackage S E} where
  traceMapContinuous : Prop
  traceMapSurjective : Prop
  traceMapKernelCharacterization : Prop

structure MixedBVPTraceTheoremEvidence {S : MixedBVPSobolevSpacePackage}
    {E : EllipticRegularityPackage S} {P : ParabolicEvolutionPackage S E}
    (T : MixedBVPTraceTheoremPackage S E P) where
  traceMapContinuousClosed : T.traceMapContinuous
  traceMapSurjectiveClosed : T.traceMapSurjective
  traceMapKernelCharacterizationClosed : T.traceMapKernelCharacterization

def MixedBVPTraceTheoremClosed {S : MixedBVPSobolevSpacePackage}
    {E : EllipticRegularityPackage S} {P : ParabolicEvolutionPackage S E}
    (T : MixedBVPTraceTheoremPackage S E P) : Prop :=
  T.traceMapContinuous ∧ T.traceMapSurjective ∧ T.traceMapKernelCharacterization

theorem mixed_bvp_trace_theorem_closed_from_evidence
    {S : MixedBVPSobolevSpacePackage} {E : EllipticRegularityPackage S}
    {P : ParabolicEvolutionPackage S E} (T : MixedBVPTraceTheoremPackage S E P)
    (Ev : MixedBVPTraceTheoremEvidence T) : MixedBVPTraceTheoremClosed T := by
  exact And.intro Ev.traceMapContinuousClosed
    (And.intro Ev.traceMapSurjectiveClosed Ev.traceMapKernelCharacterizationClosed)

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse