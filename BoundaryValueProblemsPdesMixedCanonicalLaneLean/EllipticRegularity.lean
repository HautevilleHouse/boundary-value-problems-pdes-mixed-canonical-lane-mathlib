import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure EllipticRegularityPackage where
  operator : Type u
  solutionClass : Type v
  regularityGain : Prop
  boundaryCompatibility : Prop

structure EllipticRegularityEvidence (E : EllipticRegularityPackage) where
  regularityGainClosed : E.regularityGain
  boundaryCompatibilityClosed : E.boundaryCompatibility

def EllipticRegularityClosed (E : EllipticRegularityPackage) : Prop :=
  E.regularityGain ∧ E.boundaryCompatibility

theorem elliptic_regularity_closed_from_evidence (E : EllipticRegularityPackage) (Ev : EllipticRegularityEvidence E) :
    EllipticRegularityClosed E := by
  exact And.intro Ev.regularityGainClosed Ev.boundaryCompatibilityClosed

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse
