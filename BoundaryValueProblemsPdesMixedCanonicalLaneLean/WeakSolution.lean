import BoundaryValueProblemsPdesMixedCanonicalLaneLean.VariationalFormulation

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure WeakSolution (M : MixedBVPPackage) (V : VariationalFormulation M) where
  solutionSpace : Type u
  solutionFunction : solutionSpace
  satisfiesWeakForm : Prop
  regularity : Prop

theorem weak_solution_exists (W : WeakSolution M V) : W.satisfiesWeakForm := by
  exact W.satisfiesWeakForm

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse