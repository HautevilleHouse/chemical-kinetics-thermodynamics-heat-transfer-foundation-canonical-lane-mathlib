import ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure ReactionRatePackage where
  reactants : Type u
  products : Type v
  rateConstant : Type w
  concentrationVector : Type x
  massActionTerm : Prop
  activationEnergy : Prop
  temperatureDependence : Prop
  rateLaw : Prop

structure ReactionRateEvidence (R : ReactionRatePackage) where
  massActionTermClosed : R.massActionTerm
  activationEnergyClosed : R.activationEnergy
  temperatureDependenceClosed : R.temperatureDependence
  rateLawClosed : R.rateLaw

def ReactionRateClosed (R : ReactionRatePackage) : Prop :=
  R.massActionTerm ∧ R.activationEnergy ∧ R.temperatureDependence ∧ R.rateLaw

theorem reaction_rate_closed_from_evidence (R : ReactionRatePackage) (E : ReactionRateEvidence R) :
    ReactionRateClosed R := by
  exact And.intro E.massActionTermClosed (And.intro E.activationEnergyClosed (And.intro E.temperatureDependenceClosed E.rateLawClosed))

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse