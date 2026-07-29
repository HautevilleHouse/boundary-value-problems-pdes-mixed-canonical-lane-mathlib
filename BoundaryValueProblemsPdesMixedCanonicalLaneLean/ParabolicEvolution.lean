import BoundaryValueProblemsPdesMixedCanonicalLaneLean.EllipticRegularity

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure ParabolicEvolutionPackage {S : MixedBVPSobolevSpacePackage}
    {E : EllipticRegularityPackage S} where
  timeDomain : Type u
  semigroup : Type v
  maximalExistence : Prop
  smoothingEffect : Prop

structure ParabolicEvolutionEvidence {S : MixedBVPSobolevSpacePackage}
    {E : EllipticRegularityPackage S} (P : ParabolicEvolutionPackage S E) where
  maximalExistenceClosed : P.maximalExistence
  smoothingEffectClosed : P.smoothingEffect

def ParabolicEvolutionClosed {S : MixedBVPSobolevSpacePackage}
    {E : EllipticRegularityPackage S} (P : ParabolicEvolutionPackage S E) : Prop :=
  P.maximalExistence ∧ P.smoothingEffect

theorem parabolic_evolution_closed_from_evidence
    {S : MixedBVPSobolevSpacePackage} {E : EllipticRegularityPackage S}
    (P : ParabolicEvolutionPackage S E) (Ev : ParabolicEvolutionEvidence P) :
    ParabolicEvolutionClosed P := by
  exact And.intro Ev.maximalExistenceClosed Ev.smoothingEffectClosed

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse