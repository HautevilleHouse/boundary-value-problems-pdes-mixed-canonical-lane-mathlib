import HautevilleHouse.BoundaryValueProblemsPdesMixedCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure MixedTypeBVPPackage where
  pdeSystem : String
  domain : String
  boundaryConditions : String
  wellposedness : Prop
  regularity : Prop
  continuousDependence : Prop

structure MixedTypeBVPEvidence (pkg : MixedTypeBVPPackage) where
  wellposednessClosed : pkg.wellposedness
  regularityClosed : pkg.regularity
  continuousDependenceClosed : pkg.continuousDependence

def MixedTypeBVPClosed (pkg : MixedTypeBVPPackage) : Prop :=
  pkg.wellposedness ∧ pkg.regularity ∧ pkg.continuousDependence

theorem mixed_type_bvp_closed_from_evidence (pkg : MixedTypeBVPPackage) (ev : MixedTypeBVPEvidence pkg) :
    MixedTypeBVPClosed pkg :=
  And.intro ev.wellposednessClosed (And.intro ev.regularityClosed ev.continuousDependenceClosed)

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse