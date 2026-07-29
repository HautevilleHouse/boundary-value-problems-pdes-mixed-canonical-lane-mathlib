import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure StrongFormulationPDEPackage where
  domain : Type u
  boundary : Type v
  pdeOperator : Type w
  solutionSpace : Type x
  strongSolution : domain → ℝ
  strongSolutionSatisfiesPDE : Prop
  strongSolutionSatisfiesBC : Prop

structure StrongFormulationPDEEvidence (P : StrongFormulationPDEPackage) where
  strongSolutionSatisfiesPDEClosed : P.strongSolutionSatisfiesPDE
  strongSolutionSatisfiesBCClosed : P.strongSolutionSatisfiesBC

def StrongFormulationPDEClosed (P : StrongFormulationPDEPackage) : Prop :=
  P.strongSolutionSatisfiesPDE ∧ P.strongSolutionSatisfiesBC

theorem strong_formulation_pde_closed_from_evidence
    (P : StrongFormulationPDEPackage) (E : StrongFormulationPDEEvidence P) :
    StrongFormulationPDEClosed P := by
  exact And.intro E.strongSolutionSatisfiesPDEClosed E.strongSolutionSatisfiesBCClosed

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse