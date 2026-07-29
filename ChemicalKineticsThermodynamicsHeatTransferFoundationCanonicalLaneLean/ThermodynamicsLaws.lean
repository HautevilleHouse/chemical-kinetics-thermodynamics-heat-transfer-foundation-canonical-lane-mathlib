import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure ThermodynamicsLawsPackage where
  zerothLaw : Prop
  firstLaw : Prop
  secondLaw : Prop
  thirdLaw : Prop
  stateFunctions : Prop
  gibbFreeEnergy : Prop
  spontaneityCriterion : Prop

structure ThermodynamicsLawsEvidence (T : ThermodynamicsLawsPackage) where
  zerothLawClosed : T.zerothLaw
  firstLawClosed : T.firstLaw
  secondLawClosed : T.secondLaw
  thirdLawClosed : T.thirdLaw
  stateFunctionsClosed : T.stateFunctions
  gibbFreeEnergyClosed : T.gibbFreeEnergy
  spontaneityCriterionClosed : T.spontaneityCriterion

def ThermodynamicsLawsClosed (T : ThermodynamicsLawsPackage) : Prop :=
  T.zerothLaw ∧ T.firstLaw ∧ T.secondLaw ∧ T.thirdLaw ∧ T.stateFunctions ∧ T.gibbFreeEnergy ∧ T.spontaneityCriterion

theorem thermodynamics_laws_closed_from_evidence (T : ThermodynamicsLawsPackage) (E : ThermodynamicsLawsEvidence T) :
    ThermodynamicsLawsClosed T := by
  exact And.intro E.zerothLawClosed (And.intro E.firstLawClosed (And.intro E.secondLawClosed (And.intro E.thirdLawClosed (And.intro E.stateFunctionsClosed (And.intro E.gibbFreeEnergyClosed E.spontaneityCriterionClosed)))))

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse
