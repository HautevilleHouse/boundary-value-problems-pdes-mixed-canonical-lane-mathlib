import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure ParabolicOperator where
  domain : Type
  timeDomain : Type
  parabolicityConstant : Prop

structure ParabolicBVPackage (P : ParabolicOperator) where
  initialCondition : Type
  boundaryData : Type
  weakFormulation : Prop
  maximalExistence : Prop

structure ParabolicBVPEvidence (P : ParabolicOperator) (Pkg : ParabolicBVPackage P) where
  weakFormulationClosed : Pkg.weakFormulation
  maximalExistenceClosed : Pkg.maximalExistence

def ParabolicBVPClosed (P : ParabolicOperator) (Pkg : ParabolicBVPackage P) : Prop :=
  Pkg.weakFormulation ∧ Pkg.maximalExistence

theorem parabolic_bvp_closed_from_evidence
    (P : ParabolicOperator) (Pkg : ParabolicBVPackage P) (Ev : ParabolicBVPEvidence P Pkg) :
    ParabolicBVPClosed P Pkg := by
  exact And.intro Ev.weakFormulationClosed Ev.maximalExistenceClosed

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse