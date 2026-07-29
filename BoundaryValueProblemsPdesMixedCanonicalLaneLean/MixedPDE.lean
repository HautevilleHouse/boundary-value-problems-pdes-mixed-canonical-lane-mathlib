import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure MixedPDEPackage (E : EllipticPDEPackage) (P : ParabolicPDEPackage E) (H : HyperbolicPDEPackage E) where
  couplingCondition : Prop
  wellPosednessMixed : Prop
  regularityMixed : Prop

structure MixedPDEEvidence (E : EllipticPDEPackage) (P : ParabolicPDEPackage E) (H : HyperbolicPDEPackage E)
    (M : MixedPDEPackage E P H) where
  couplingConditionClosed : M.couplingCondition
  wellPosednessMixedClosed : M.wellPosednessMixed
  regularityMixedClosed : M.regularityMixed

def MixedPDEClosed (E : EllipticPDEPackage) (P : ParabolicPDEPackage E) (H : HyperbolicPDEPackage E)
    (M : MixedPDEPackage E P H) : Prop :=
  M.couplingCondition ∧ M.wellPosednessMixed ∧ M.regularityMixed

theorem mixed_pde_closed_from_evidence (E : EllipticPDEPackage) (P : ParabolicPDEPackage E)
    (H : HyperbolicPDEPackage E) (M : MixedPDEPackage E P H)
    (Ev : MixedPDEEvidence E P H M) : MixedPDEClosed E P H M := by
  exact And.intro Ev.couplingConditionClosed
    (And.intro Ev.wellPosednessMixedClosed Ev.regularityMixedClosed)

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse