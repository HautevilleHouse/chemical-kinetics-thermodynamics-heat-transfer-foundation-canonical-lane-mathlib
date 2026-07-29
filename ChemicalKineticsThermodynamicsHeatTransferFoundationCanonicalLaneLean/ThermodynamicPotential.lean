import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure ThermodynamicPotentialPackage where
  gibbsFreeEnergy : Prop
  enthalpy : Prop
  entropy : Prop
  internalEnergy : Prop
  helmholtzFreeEnergy : Prop
  equilibriumCondition : Prop

structure ThermodynamicPotentialEvidence (T : ThermodynamicPotentialPackage) where
  gibbsFreeEnergyClosed : T.gibbsFreeEnergy
  enthalpyClosed : T.enthalpy
  entropyClosed : T.entropy
  internalEnergyClosed : T.internalEnergy
  helmholtzFreeEnergyClosed : T.helmholtzFreeEnergy
  equilibriumConditionClosed : T.equilibriumCondition

def ThermodynamicPotentialClosed (T : ThermodynamicPotentialPackage) : Prop :=
  T.gibbsFreeEnergy ∧ T.enthalpy ∧ T.entropy ∧ T.internalEnergy ∧ T.helmholtzFreeEnergy ∧ T.equilibriumCondition

theorem thermodynamic_potential_closed_from_evidence (T : ThermodynamicPotentialPackage) (E : ThermodynamicPotentialEvidence T) :
    ThermodynamicPotentialClosed T := by
  exact And.intro E.gibbsFreeEnergyClosed
    (And.intro E.enthalpyClosed
      (And.intro E.entropyClosed
        (And.intro E.internalEnergyClosed
          (And.intro E.helmholtzFreeEnergyClosed E.equilibriumConditionClosed))))

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse