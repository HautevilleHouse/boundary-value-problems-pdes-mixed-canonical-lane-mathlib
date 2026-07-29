import HautevilleHouse.BoundaryValueProblemsPdesMixedCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure EllipticBVPPackage where
  ellipticOperator : String
  domainType : String
  boundaryCondition : String
  existenceTheorem : Prop
  uniquenessTheorem : Prop
  regularityTheorem : Prop

structure EllipticBVPEvidence (pkg : EllipticBVPPackage) where
  existenceClosed : pkg.existenceTheorem
  uniquenessClosed : pkg.uniquenessTheorem
  regularityClosed : pkg.regularityTheorem

def EllipticBVPClosed (pkg : EllipticBVPPackage) : Prop :=
  pkg.existenceTheorem ∧ pkg.uniquenessTheorem ∧ pkg.regularityTheorem

theorem elliptic_bvp_closed_from_evidence (pkg : EllipticBVPPackage) (ev : EllipticBVPEvidence pkg) :
    EllipticBVPClosed pkg :=
  And.intro ev.existenceClosed (And.intro ev.uniquenessClosed ev.regularityClosed)

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse