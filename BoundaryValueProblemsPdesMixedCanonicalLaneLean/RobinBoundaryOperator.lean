import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure RobinBoundaryOperator where
  domain : Type u
  boundary : Type v
  coefficient : Type w
  traceOperator : Type x
  wellPosed : Prop

structure RobinBoundaryOperatorEvidence (R : RobinBoundaryOperator) where
  coefficientNonzero : Prop
  traceContinuity : Prop
  wellPosedClosed : R.wellPosed

def RobinBoundaryOperatorClosed (R : RobinBoundaryOperator) : Prop :=
  R.wellPosed

theorem robin_boundary_operator_closed_from_evidence
    (R : RobinBoundaryOperator) (E : RobinBoundaryOperatorEvidence R) :
    RobinBoundaryOperatorClosed R := by
  exact E.wellPosedClosed

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse
