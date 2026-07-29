import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure FiniteElementDiscretization where
  mesh : Type u
  elementType : Nat
  conforming : Prop
  stability : Prop

structure FiniteElementDiscretizationEvidence (F : FiniteElementDiscretization) where
  conformingClosed : F.conforming
  stabilityClosed : F.stability

def FiniteElementDiscretizationClosed (F : FiniteElementDiscretization) : Prop :=
  F.conforming ∧ F.stability

theorem finite_element_discretization_closed_from_evidence
    (F : FiniteElementDiscretization) (E : FiniteElementDiscretizationEvidence F) :
    FiniteElementDiscretizationClosed F := by
  exact And.intro E.conformingClosed E.stabilityClosed

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse
