import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure ReactionDiffusionInterface where
  interfaceDomain : Type u
  bulkDomains : List (Type v)
  reactionRates : Type w
  interfaceConditions : Prop
  wellPosed : Prop

structure ReactionDiffusionInterfaceEvidence (I : ReactionDiffusionInterface) where
  interfaceConditionsClosed : I.interfaceConditions
  wellPosedClosed : I.wellPosed

def ReactionDiffusionInterfaceClosed (I : ReactionDiffusionInterface) : Prop :=
  I.interfaceConditions ∧ I.wellPosed

theorem reaction_diffusion_interface_closed_from_evidence
    (I : ReactionDiffusionInterface) (E : ReactionDiffusionInterfaceEvidence I) :
    ReactionDiffusionInterfaceClosed I := by
  exact And.intro E.interfaceConditionsClosed E.wellPosedClosed

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse
