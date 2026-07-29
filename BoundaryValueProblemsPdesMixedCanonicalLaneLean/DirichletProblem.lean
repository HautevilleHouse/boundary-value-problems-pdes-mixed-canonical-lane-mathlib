import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure DirichletProblemPackage where
  domain : Type u
  boundaryData : Type v
  ellipticOperator : Type w
  solutionExists : Prop
  uniqueness : Prop

structure DirichletProblemEvidence (D : DirichletProblemPackage) where
  solutionExistsClosed : D.solutionExists
  uniquenessClosed : D.uniqueness

def DirichletProblemClosed (D : DirichletProblemPackage) : Prop :=
  D.solutionExists ∧ D.uniqueness

theorem dirichlet_problem_closed_from_evidence (D : DirichletProblemPackage) (E : DirichletProblemEvidence D) :
    DirichletProblemClosed D := by
  exact And.intro E.solutionExistsClosed E.uniquenessClosed

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse
