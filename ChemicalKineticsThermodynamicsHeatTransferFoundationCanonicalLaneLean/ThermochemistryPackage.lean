import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure ThermochemistryPackage where
  system : Type u
  internalEnergy : system -> ℝ
  enthalpy : system -> ℝ
  entropy : system -> ℝ
  gibbsFreeEnergy : system -> ℝ
  firstLaw : Prop
  secondLaw : Prop
  thirdLaw : Prop

structure ThermochemistryEvidence (T : ThermochemistryPackage) where
  firstLawClosed : T.firstLaw
  secondLawClosed : T.secondLaw
  thirdLawClosed : T.thirdLaw
  energyConservation : ∀ s, T.internalEnergy s = T.enthalpy s - T.entropy s * 298.15

def ThermochemistryClosed (T : ThermochemistryPackage) : Prop :=
  T.firstLaw ∧ T.secondLaw ∧ T.thirdLaw ∧
  (∀ s, T.internalEnergy s = T.enthalpy s - T.entropy s * 298.15)

theorem thermochemistry_closed_from_evidence (T : ThermochemistryPackage)
    (E : ThermochemistryEvidence T) : ThermochemistryClosed T :=
  And.intro E.firstLawClosed (And.intro E.secondLawClosed (And.intro E.thirdLawClosed E.energyConservation))

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse