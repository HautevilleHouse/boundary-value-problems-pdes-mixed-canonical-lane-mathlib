import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure EllipticPDEPackage where
  operator : Type
  bilinearForm : Type
  coercivityCondition : Prop
  boundednessCondition : Prop
  weakSolutionExistence : Prop

structure EllipticPDEEvidence (E : EllipticPDEPackage) where
  coercivityConditionClosed : E.coercivityCondition
  boundednessConditionClosed : E.boundednessCondition
  weakSolutionExistenceClosed : E.weakSolutionExistence

def EllipticPDEClosed (E : EllipticPDEPackage) : Prop :=
  E.coercivityCondition ∧ E.boundednessCondition ∧ E.weakSolutionExistence

theorem elliptic_pde_closed_from_evidence (E : EllipticPDEPackage)
    (Ev : EllipticPDEEvidence E) : EllipticPDEClosed E := by
  exact And.intro Ev.coercivityConditionClosed
    (And.intro Ev.boundednessConditionClosed Ev.weakSolutionExistenceClosed)

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse