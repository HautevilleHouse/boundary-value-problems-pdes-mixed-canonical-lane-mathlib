import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure VariationalFormulationPackage where
  bilinearForm : Type u
  linearForm : Type v
  coercivity : Prop
  boundedness : Prop
  solutionViaLaxMilgram : Prop

structure VariationalFormulationEvidence (V : VariationalFormulationPackage) where
  coercivityClosed : V.coercivity
  boundednessClosed : V.boundedness
  solutionViaLaxMilgramClosed : V.solutionViaLaxMilgram

def VariationalFormulationClosed (V : VariationalFormulationPackage) : Prop :=
  V.coercivity ∧ V.boundedness ∧ V.solutionViaLaxMilgram

theorem variational_formulation_closed_from_evidence (V : VariationalFormulationPackage) (E : VariationalFormulationEvidence V) :
    VariationalFormulationClosed V := by
  exact And.intro E.coercivityClosed (And.intro E.boundednessClosed E.solutionViaLaxMilgramClosed)

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse
