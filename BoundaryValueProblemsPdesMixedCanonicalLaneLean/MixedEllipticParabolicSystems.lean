import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure MixedEllipticParabolicSystem where
  ellipticPart : Type u
  parabolicPart : Type v
  couplingCondition : Prop
  regularity : Prop

structure MixedEllipticParabolicSystemEvidence (S : MixedEllipticParabolicSystem) where
  couplingConditionClosed : S.couplingCondition
  regularityClosed : S.regularity

def MixedEllipticParabolicSystemClosed (S : MixedEllipticParabolicSystem) : Prop :=
  S.couplingCondition ∧ S.regularity

theorem mixed_elliptic_parabolic_system_closed_from_evidence
    (S : MixedEllipticParabolicSystem) (E : MixedEllipticParabolicSystemEvidence S) :
    MixedEllipticParabolicSystemClosed S := by
  exact And.intro E.couplingConditionClosed E.regularityClosed

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse
