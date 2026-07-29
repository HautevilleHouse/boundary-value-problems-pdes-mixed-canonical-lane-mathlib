import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure DomainDecompositionPackage where
  overlappingSubdomains : Type u
  interfaceConditions : Prop
  schwarzIterationConverges : Prop
  globalSolutionReconstructed : Prop

structure DomainDecompositionEvidence (D : DomainDecompositionPackage) where
  interfaceConditionsClosed : D.interfaceConditions
  schwarzIterationConvergesClosed : D.schwarzIterationConverges
  globalSolutionReconstructedClosed : D.globalSolutionReconstructed

def DomainDecompositionClosed (D : DomainDecompositionPackage) : Prop :=
  D.interfaceConditions ∧ D.schwarzIterationConverges ∧ D.globalSolutionReconstructed

theorem domain_decomposition_closed_from_evidence
    (D : DomainDecompositionPackage) (E : DomainDecompositionEvidence D) :
    DomainDecompositionClosed D := by
  exact And.intro E.interfaceConditionsClosed
    (And.intro E.schwarzIterationConvergesClosed E.globalSolutionReconstructedClosed)

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse