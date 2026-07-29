import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure ParabolicWellposednessPackage where
  timeDomain : Type u
  spatialDomain : Type v
  parabolicOperator : Prop
  initialCondition : Prop
  boundaryCondition : Prop
  existence : Prop
  uniqueness : Prop
  continuousDependence : Prop

structure ParabolicWellposednessEvidence (P : ParabolicWellposednessPackage) where
  parabolicOperatorClosed : P.parabolicOperator
  initialConditionClosed : P.initialCondition
  boundaryConditionClosed : P.boundaryCondition
  existenceClosed : P.existence
  uniquenessClosed : P.uniqueness
  continuousDependenceClosed : P.continuousDependence

def ParabolicWellposednessClosed (P : ParabolicWellposednessPackage) : Prop :=
  P.parabolicOperator ∧ P.initialCondition ∧ P.boundaryCondition ∧
  P.existence ∧ P.uniqueness ∧ P.continuousDependence

theorem parabolic_wellposedness_closed_from_evidence (P : ParabolicWellposednessPackage)
    (Ev : ParabolicWellposednessEvidence P) : ParabolicWellposednessClosed P := by
  exact And.intro Ev.parabolicOperatorClosed
    (And.intro Ev.initialConditionClosed
      (And.intro Ev.boundaryConditionClosed
        (And.intro Ev.existenceClosed
          (And.intro Ev.uniquenessClosed Ev.continuousDependenceClosed))))

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse
