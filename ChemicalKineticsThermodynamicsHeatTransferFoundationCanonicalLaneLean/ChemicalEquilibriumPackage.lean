import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure ChemicalEquilibriumPackage where
  reaction : Type u
  equilibriumConstant : reaction -> ℝ
  reactionQuotient : reaction -> ℝ
  gibbsFreeEnergyChange : reaction -> ℝ
  equilibriumCondition : Prop
  leChatelierPrinciple : Prop

structure ChemicalEquilibriumEvidence (E : ChemicalEquilibriumPackage) where
  equilibriumConditionClosed : E.equilibriumCondition
  leChatelierPrincipleClosed : E.leChatelierPrinciple
  relationClosed : ∀ r, E.gibbsFreeEnergyChange r = -8.314 * 298.15 * Real.log (E.equilibriumConstant r)

def ChemicalEquilibriumClosed (E : ChemicalEquilibriumPackage) : Prop :=
  E.equilibriumCondition ∧ E.leChatelierPrinciple ∧
  (∀ r, E.gibbsFreeEnergyChange r = -8.314 * 298.15 * Real.log (E.equilibriumConstant r))

theorem chemical_equilibrium_closed_from_evidence (E : ChemicalEquilibriumPackage)
    (Ev : ChemicalEquilibriumEvidence E) : ChemicalEquilibriumClosed E :=
  And.intro Ev.equilibriumConditionClosed (And.intro Ev.leChatelierPrincipleClosed Ev.relationClosed)

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse