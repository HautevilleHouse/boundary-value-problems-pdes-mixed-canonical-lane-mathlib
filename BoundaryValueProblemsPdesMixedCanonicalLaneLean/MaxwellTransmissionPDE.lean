import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure MaxwellTransmissionPackage where
  domainInterior : Type u
  subdomainInterface : Type v
  permittivityJump : Prop
  continuityOfTangentialComponent : Prop
  transmissionConditionSatisfied : Prop

structure MaxwellTransmissionEvidence (M : MaxwellTransmissionPackage) where
  continuityOfTangentialComponentClosed : M.continuityOfTangentialComponent
  transmissionConditionSatisfiedClosed : M.transmissionConditionSatisfied

def MaxwellTransmissionClosed (M : MaxwellTransmissionPackage) : Prop :=
  M.continuityOfTangentialComponent ∧ M.transmissionConditionSatisfied

theorem maxwell_transmission_closed_from_evidence
    (M : MaxwellTransmissionPackage) (E : MaxwellTransmissionEvidence M) :
    MaxwellTransmissionClosed M := by
  exact And.intro E.continuityOfTangentialComponentClosed E.transmissionConditionSatisfiedClosed

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse