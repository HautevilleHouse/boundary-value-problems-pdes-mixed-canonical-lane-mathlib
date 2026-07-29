import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure FiniteElementMixedPackage where
  triangulation : Type u
  infSupCondition : Prop
  discreteSolutionConverges : Prop
  errorEstimateOptimal : Prop

structure FiniteElementMixedEvidence (F : FiniteElementMixedPackage) where
  infSupConditionClosed : F.infSupCondition
  discreteSolutionConvergesClosed : F.discreteSolutionConverges
  errorEstimateOptimalClosed : F.errorEstimateOptimal

def FiniteElementMixedClosed (F : FiniteElementMixedPackage) : Prop :=
  F.infSupCondition ∧ F.discreteSolutionConverges ∧ F.errorEstimateOptimal

theorem finite_element_mixed_closed_from_evidence
    (F : FiniteElementMixedPackage) (E : FiniteElementMixedEvidence F) :
    FiniteElementMixedClosed F := by
  exact And.intro E.infSupConditionClosed
    (And.intro E.discreteSolutionConvergesClosed E.errorEstimateOptimalClosed)

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse