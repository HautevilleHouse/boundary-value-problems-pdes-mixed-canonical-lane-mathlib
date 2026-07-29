import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure SobolevSpacePackage where
  domain : Type u
  measure : Type v
  exponent : ℝ
  weakDerivativeExists : Prop
  normDefined : Prop

structure SobolevSpaceEvidence (S : SobolevSpacePackage) where
  weakDerivativeExistsClosed : S.weakDerivativeExists
  normDefinedClosed : S.normDefined

def SobolevSpaceClosed (S : SobolevSpacePackage) : Prop :=
  S.weakDerivativeExists ∧ S.normDefined

theorem sobolev_space_closed_from_evidence (S : SobolevSpacePackage) (E : SobolevSpaceEvidence S) :
    SobolevSpaceClosed S := by
  exact And.intro E.weakDerivativeExistsClosed E.normDefinedClosed

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse
