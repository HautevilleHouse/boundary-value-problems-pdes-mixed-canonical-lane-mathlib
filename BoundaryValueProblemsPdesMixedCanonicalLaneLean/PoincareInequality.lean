import canonicalLaneMathlib.MathlibObjects
import Mathlib.Analysis.Calculus.MeanInequalities

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure PoincareInequalityPackage {Ω : BVPSpace} where
  domain : BVPSpace := Ω
  poincareConstant : ℝ
  inequalityHolds : ∀ f : Ω.carrier → ℝ, (∫ x in Ω, f x^2) ≤ poincareConstant * (∫ x in Ω, ‖∇ f x‖^2)
  domainSmoothEnough : Prop
  constantOptimal : Prop

structure PoincareInequalityEvidence {Ω : BVPSpace} (P : PoincareInequalityPackage Ω) where
  inequalityHoldsClosed : P.inequalityHolds
  domainSmoothEnoughClosed : P.domainSmoothEnough
  constantOptimalClosed : P.constantOptimal

def PoincareInequalityClosed {Ω : BVPSpace} (P : PoincareInequalityPackage Ω) : Prop :=
  P.inequalityHolds ∧ P.domainSmoothEnough ∧ P.constantOptimal

theorem poincare_inequality_closed_from_evidence {Ω : BVPSpace}
    (P : PoincareInequalityPackage Ω) (E : PoincareInequalityEvidence P) :
    PoincareInequalityClosed P := by
  exact And.intro E.inequalityHoldsClosed
    (And.intro E.domainSmoothEnoughClosed E.constantOptimalClosed)

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse
