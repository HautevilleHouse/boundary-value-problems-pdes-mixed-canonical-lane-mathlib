import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure BoundaryConditionsPackage where
  dirichletCondition : Prop
  neumannCondition : Prop
  robinCondition : Prop
  compatibilityWithPDE : Prop

structure BoundaryConditionsEvidence (B : BoundaryConditionsPackage) where
  dirichletConditionClosed : B.dirichletCondition
  neumannConditionClosed : B.neumannCondition
  robinConditionClosed : B.robinCondition
  compatibilityWithPDEClosed : B.compatibilityWithPDE

def BoundaryConditionsClosed (B : BoundaryConditionsPackage) : Prop :=
  B.dirichletCondition ∧ B.neumannCondition ∧ B.robinCondition ∧ B.compatibilityWithPDE

theorem boundary_conditions_closed_from_evidence (B : BoundaryConditionsPackage)
    (Ev : BoundaryConditionsEvidence B) : BoundaryConditionsClosed B := by
  exact And.intro Ev.dirichletConditionClosed
    (And.intro Ev.neumannConditionClosed
      (And.intro Ev.robinConditionClosed Ev.compatibilityWithPDEClosed))

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse