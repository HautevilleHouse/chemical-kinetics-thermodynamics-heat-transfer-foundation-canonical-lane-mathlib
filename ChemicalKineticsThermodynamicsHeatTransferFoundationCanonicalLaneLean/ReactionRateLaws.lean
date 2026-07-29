import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure ReactionRateLawPackage where
  reactantConcentrations : Type u
  temperature : Type v
  rateConstant : Type w
  empiricalRateEquation : Prop
  arrheniusLaw : Prop
  elementaryReactionOrder : Prop
  steadyStateApproximation : Prop

structure ReactionRateLawEvidence (R : ReactionRateLawPackage) where
  empiricalRateEquationClosed : R.empiricalRateEquation
  arrheniusLawClosed : R.arrheniusLaw
  elementaryReactionOrderClosed : R.elementaryReactionOrder
  steadyStateApproximationClosed : R.steadyStateApproximation

def ReactionRateLawClosed (R : ReactionRateLawPackage) : Prop :=
  R.empiricalRateEquation ∧ R.arrheniusLaw ∧ R.elementaryReactionOrder ∧ R.steadyStateApproximation

theorem reaction_rate_law_closed_from_evidence (R : ReactionRateLawPackage) (E : ReactionRateLawEvidence R) : ReactionRateLawClosed R := by
  exact And.intro E.empiricalRateEquationClosed (And.intro E.arrheniusLawClosed (And.intro E.elementaryReactionOrderClosed E.steadyStateApproximationClosed))

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse