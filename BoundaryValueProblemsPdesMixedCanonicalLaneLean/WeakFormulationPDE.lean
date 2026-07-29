import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure WeakFormulationPDEPackage where
  functionSpace : Type u
  bilinearForm : functionSpace → functionSpace → ℝ
  linearFunctional : functionSpace → ℝ
  weakSolution : functionSpace
  coercivity : Prop
  boundedness : Prop
  weakFormulationSatisfied : Prop

structure WeakFormulationPDEEvidence (W : WeakFormulationPDEPackage) where
  coercivityClosed : W.coercivity
  boundednessClosed : W.boundedness
  weakFormulationSatisfiedClosed : W.weakFormulationSatisfied

def WeakFormulationPDEClosed (W : WeakFormulationPDEPackage) : Prop :=
  W.coercivity ∧ W.boundedness ∧ W.weakFormulationSatisfied

theorem weak_formulation_pde_closed_from_evidence
    (W : WeakFormulationPDEPackage) (E : WeakFormulationPDEEvidence W) :
    WeakFormulationPDEClosed W := by
  exact And.intro E.coercivityClosed
    (And.intro E.boundednessClosed E.weakFormulationSatisfiedClosed)

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse