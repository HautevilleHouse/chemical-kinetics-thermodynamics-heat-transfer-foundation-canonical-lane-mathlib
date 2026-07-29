import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure ReactionRateLawPackage where
  temperature : Type u
  concentration : Type v
  reactionConstant : Type w
  arrheniusPrefactor : Prop
  activationEnergy : Prop
  rateEquation : Prop

structure ReactionRateLawEvidence (R : ReactionRateLawPackage) where
  arrheniusPrefactorClosed : R.arrheniusPrefactor
  activationEnergyClosed : R.activationEnergy
  rateEquationClosed : R.rateEquation

def ReactionRateLawClosed (R : ReactionRateLawPackage) : Prop :=
  R.arrheniusPrefactor ∧ R.activationEnergy ∧ R.rateEquation

theorem reaction_rate_law_closed_from_evidence (R : ReactionRateLawPackage) (E : ReactionRateLawEvidence R) :
    ReactionRateLawClosed R := by
  exact And.intro E.arrheniusPrefactorClosed (And.intro E.activationEnergyClosed E.rateEquationClosed)

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse