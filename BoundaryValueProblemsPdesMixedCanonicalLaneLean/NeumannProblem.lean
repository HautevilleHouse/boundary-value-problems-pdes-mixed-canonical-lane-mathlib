import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure NeumannProblemPackage where
  domain : Type u
  boundaryData : Type v
  ellipticOperator : Type w
  normalDerivativeCondition : Prop
  solutionExists : Prop

structure NeumannProblemEvidence (N : NeumannProblemPackage) where
  normalDerivativeConditionClosed : N.normalDerivativeCondition
  solutionExistsClosed : N.solutionExists

def NeumannProblemClosed (N : NeumannProblemPackage) : Prop :=
  N.normalDerivativeCondition ∧ N.solutionExists

theorem neumann_problem_closed_from_evidence (N : NeumannProblemPackage) (E : NeumannProblemEvidence N) :
    NeumannProblemClosed N := by
  exact And.intro E.normalDerivativeConditionClosed E.solutionExistsClosed

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse
