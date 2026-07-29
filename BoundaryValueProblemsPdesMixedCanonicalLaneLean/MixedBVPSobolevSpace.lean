import BoundaryValueProblemsPdesMixedCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure MixedBVPSobolevSpacePackage where
  domain : Type u
  boundary : Type v
  sobolevNorm : Type w
  traceOperator : Type x
  embeddingCompact : Prop
  poincareInequality : Prop

structure MixedBVPSobolevSpaceEvidence (S : MixedBVPSobolevSpacePackage) where
  embeddingCompactClosed : S.embeddingCompact
  poincareInequalityClosed : S.poincareInequality

def MixedBVPSobolevSpaceClosed (S : MixedBVPSobolevSpacePackage) : Prop :=
  S.embeddingCompact ∧ S.poincareInequality

theorem mixed_bvp_sobolev_space_closed_from_evidence
    (S : MixedBVPSobolevSpacePackage) (E : MixedBVPSobolevSpaceEvidence S) :
    MixedBVPSobolevSpaceClosed S := by
  exact And.intro E.embeddingCompactClosed E.poincareInequalityClosed

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse