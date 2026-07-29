import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure HyperbolicPDEPackage (E : EllipticPDEPackage) where
  waveOperator : Type
  finiteSpeedPropagation : Prop
  weakSolutionExistenceHyperbolic : Prop
  uniqueContinuation : Prop

structure HyperbolicPDEEvidence (E : EllipticPDEPackage) (H : HyperbolicPDEPackage E) where
  finiteSpeedPropagationClosed : H.finiteSpeedPropagation
  weakSolutionExistenceHyperbolicClosed : H.weakSolutionExistenceHyperbolic
  uniqueContinuationClosed : H.uniqueContinuation

def HyperbolicPDEClosed (E : EllipticPDEPackage) (H : HyperbolicPDEPackage E) : Prop :=
  H.finiteSpeedPropagation ∧ H.weakSolutionExistenceHyperbolic ∧ H.uniqueContinuation

theorem hyperbolic_pde_closed_from_evidence (E : EllipticPDEPackage) (H : HyperbolicPDEPackage E)
    (Ev : HyperbolicPDEEvidence E H) : HyperbolicPDEClosed E H := by
  exact And.intro Ev.finiteSpeedPropagationClosed
    (And.intro Ev.weakSolutionExistenceHyperbolicClosed Ev.uniqueContinuationClosed)

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse