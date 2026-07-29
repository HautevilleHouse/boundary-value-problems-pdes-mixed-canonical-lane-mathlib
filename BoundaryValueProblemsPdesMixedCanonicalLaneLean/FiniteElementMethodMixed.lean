import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure FiniteElementMethodData where
  meshType : String
  elementShape : String
  variationalFormulation : Prop

def FiniteElementMethodClosed (F : FiniteElementMethodData) : Prop :=
  F.variationalFormulation ∧
  (∃ (stability : Prop) (errorEstimate : Prop), stability ∧ errorEstimate)

structure FiniteElementMethodEvidence (F : FiniteElementMethodData) where
  meshRegular : Prop
  basisFunctionsComplete : Prop
  stiffnessMatrixAssembled : Prop
  loadVectorComputed : Prop
  discreteSolutionConverges : Prop
  evidenceClosed : FiniteElementMethodClosed F

theorem fem_closed_from_evidence (F : FiniteElementMethodData) (E : FiniteElementMethodEvidence F) :
    FiniteElementMethodClosed F := by
  refine And.intro ?_ ?_
  · exact F.variationalFormulation
  · exact ⟨E.stiffnessMatrixAssembled, E.discreteSolutionConverges⟩

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse