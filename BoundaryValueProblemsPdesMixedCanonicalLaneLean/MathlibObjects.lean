import canonicalLaneMathlib.MathlibCore
import Mathlib.Analysis.Sobolev

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BVPSpace where
  domain : Type
  topology : TopologicalSpace domain
  boundary : Set domain

structure BVPPoincareAdmittedObject where
  space : BVPSpace
  pdeType : String
  weakSolutionExists : Prop
  solutionRegularity : Prop
  boundaryConditionSatisfied : Prop
  conclusion : boundaryConditionSatisfied

def BVPWitnessClosed (O : BVPPoincareAdmittedObject) : Prop :=
  O.boundaryConditionSatisfied

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse
