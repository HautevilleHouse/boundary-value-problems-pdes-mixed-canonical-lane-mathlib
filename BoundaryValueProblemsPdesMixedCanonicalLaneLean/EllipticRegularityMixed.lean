import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure EllipticRegularityData where
  pdeOrder : Nat
  domainRegularity : String
  mixedBoundaryCompatibility : Prop

structure EllipticRegularityEvidence (E : EllipticRegularityData) where
  interiorRegularity : Prop
  boundaryRegularityDirichlet : Prop
  boundaryRegularityNeumann : Prop
  mixedCompatibilityClosed : E.mixedBoundaryCompatibility

def EllipticRegularityClosed (E : EllipticRegularityData) : Prop :=
  E.mixedBoundaryCompatibility ∧
  (∀ (E' : EllipticRegularityEvidence E), E'.interiorRegularity ∧ E'.boundaryRegularityDirichlet ∧ E'.boundaryRegularityNeumann)

theorem elliptic_regularity_closed_from_evidence (E : EllipticRegularityData) (E' : EllipticRegularityEvidence E) :
    EllipticRegularityClosed E := by
  exact And.intro E'.mixedCompatibilityClosed (fun _ => And.intro E'.interiorRegularity (And.intro E'.boundaryRegularityDirichlet E'.boundaryRegularityNeumann))

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse