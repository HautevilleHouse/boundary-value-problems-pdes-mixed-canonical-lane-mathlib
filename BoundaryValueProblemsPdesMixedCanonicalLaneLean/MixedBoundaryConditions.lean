import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure MixedBoundaryConditionData where
  region : Type u
  boundaryParts : List (region → Prop)
  dirichletPart : region → Prop
  neumannPart : region → Prop
  robinPart : region → Prop
  mixedPartition : region → Prop

def mixedBoundaryCondition (D : MixedBoundaryConditionData) : Prop :=
  (∀ x, D.dirichletPart x ∨ D.neumannPart x ∨ D.robinPart x → D.mixedPartition x) ∧
  (∀ x, D.mixedPartition x → D.dirichletPart x ∨ D.neumannPart x ∨ D.robinPart x)

structure MixedBoundaryEvidence (D : MixedBoundaryConditionData) where
  partitionCovers : mixedBoundaryCondition D
  boundaryPartsDisjoint : Prop
  dataClosed : mixedBoundaryCondition D ∧ boundaryPartsDisjoint

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse