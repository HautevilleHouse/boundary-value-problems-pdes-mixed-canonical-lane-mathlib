import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure EllipticOperator where
  domain : Type
  coefficient : Type
  strongForm : Type
  ellipticityConstant : Prop

structure EllipticBVPackage (E : EllipticOperator) where
  sourceTerm : Type
  dirichletData : Type
  neumannData : Type
  weakFormulation : Prop
  fredholmAlternative : Prop

structure EllipticBVPEvidence (E : EllipticOperator) (P : EllipticBVPackage E) where
  weakFormulationClosed : P.weakFormulation
  fredholmAlternativeClosed : P.fredholmAlternative

def EllipticBVPClosed (E : EllipticOperator) (P : EllipticBVPackage E) : Prop :=
  P.weakFormulation ∧ P.fredholmAlternative

theorem elliptic_bvp_closed_from_evidence
    (E : EllipticOperator) (P : EllipticBVPackage E) (Ev : EllipticBVPEvidence E P) :
    EllipticBVPClosed E P := by
  exact And.intro Ev.weakFormulationClosed Ev.fredholmAlternativeClosed

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse