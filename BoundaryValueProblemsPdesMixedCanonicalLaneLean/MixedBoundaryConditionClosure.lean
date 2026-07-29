import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure MixedBoundaryConditionPackage where
  domain : Type u
  boundaryParts : Type v
  dirichletCondition : Prop
  neumannCondition : Prop
  robinCondition : Prop
  compatibility : Prop
  wellposedness : Prop

structure MixedBoundaryConditionEvidence (M : MixedBoundaryConditionPackage) where
  dirichletConditionClosed : M.dirichletCondition
  neumannConditionClosed : M.neumannCondition
  robinConditionClosed : M.robinCondition
  compatibilityClosed : M.compatibility
  wellposednessClosed : M.wellposedness

def MixedBoundaryConditionClosed (M : MixedBoundaryConditionPackage) : Prop :=
  M.dirichletCondition ∧ M.neumannCondition ∧ M.robinCondition ∧
  M.compatibility ∧ M.wellposedness

theorem mixed_boundary_condition_closed_from_evidence (M : MixedBoundaryConditionPackage)
    (Ev : MixedBoundaryConditionEvidence M) : MixedBoundaryConditionClosed M := by
  exact And.intro Ev.dirichletConditionClosed
    (And.intro Ev.neumannConditionClosed
      (And.intro Ev.robinConditionClosed
        (And.intro Ev.compatibilityClosed Ev.wellposednessClosed)))

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse
