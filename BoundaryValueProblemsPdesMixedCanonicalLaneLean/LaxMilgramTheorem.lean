import canonicalLaneMathlib.MathlibObjects
import Mathlib.Analysis.Calculus.MeanInequalities

namespace HautevilleHouse
namespace BoundaryValueProblemsPdesMixedCanonicalLaneLean

structure LaxMilgramPackage {V : Type u} [SeminormedAddCommGroup V] [InnerProductSpace ℝ V] where
  bilinearForm : V → V → ℝ
  bounded : ∃ C : ℝ, ∀ u v : V, |bilinearForm u v| ≤ C * ‖u‖ * ‖v‖
  coercive : ∃ α : ℝ, α > 0 ∧ ∀ u : V, bilinearForm u u ≥ α * ‖u‖^2
  linearFunctional : V → ℝ
  continuous : ∃ C' : ℝ, ∀ v : V, |linearFunctional v| ≤ C' * ‖v‖

structure LaxMilgramEvidence {V : Type u} [SeminormedAddCommGroup V] [InnerProductSpace ℝ V]
    (P : LaxMilgramPackage V) where
  boundedClosed : P.bounded
  coerciveClosed : P.coercive
  continuousClosed : P.continuous

def LaxMilgramClosed {V : Type u} [SeminormedAddCommGroup V] [InnerProductSpace ℝ V]
    (P : LaxMilgramPackage V) : Prop :=
  P.bounded ∧ P.coercive ∧ P.continuous

theorem lax_milgram_closed_from_evidence {V : Type u} [SeminormedAddCommGroup V] [InnerProductSpace ℝ V]
    (P : LaxMilgramPackage V) (E : LaxMilgramEvidence P) : LaxMilgramClosed P := by
  exact And.intro E.boundedClosed (And.intro E.coerciveClosed E.continuousClosed)

end BoundaryValueProblemsPdesMixedCanonicalLaneLean
end HautevilleHouse
