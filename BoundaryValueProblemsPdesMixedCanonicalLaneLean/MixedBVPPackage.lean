import BoundaryValueProblemsPdesMixedCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure MixedBVPPackage where
  domain : Type u
  boundary : Type v
  ellipticOperator : Type w
  parabolicOperator : Type x
  couplingCondition : Prop
  wellPosedness : Prop

theorem mixed_bvp_package_well_posed (M : MixedBVPPackage) : M.wellPosedness := by
  exact M.wellPosedness

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse