import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure ParabolicPDEPackage (E : EllipticPDEPackage) where
  timeOperator : E.operator → E.operator
  coercivityParabolic : Prop
  boundednessParabolic : Prop
  weakSolutionExistenceParabolic : Prop

structure ParabolicPDEEvidence (E : EllipticPDEPackage) (P : ParabolicPDEPackage E) where
  coercivityParabolicClosed : P.coercivityParabolic
  boundednessParabolicClosed : P.boundednessParabolic
  weakSolutionExistenceParabolicClosed : P.weakSolutionExistenceParabolic

def ParabolicPDEClosed (E : EllipticPDEPackage) (P : ParabolicPDEPackage E) : Prop :=
  P.coercivityParabolic ∧ P.boundednessParabolic ∧ P.weakSolutionExistenceParabolic

theorem parabolic_pde_closed_from_evidence (E : EllipticPDEPackage) (P : ParabolicPDEPackage E)
    (Ev : ParabolicPDEEvidence E P) : ParabolicPDEClosed E P := by
  exact And.intro Ev.coercivityParabolicClosed
    (And.intro Ev.boundednessParabolicClosed Ev.weakSolutionExistenceParabolicClosed)

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse