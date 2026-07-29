import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure MolecularOrbitalTheoryPackage where
  molecule : Type u
  orbital : molecule -> Type v
  energyLevel : orbital -> ℝ
  waveFunction : orbital -> (ℝ → ℝ)
  huckelMethod : Prop
  symmetryAdaptedLinearCombination : Prop
  frontierOrbitalTheory : Prop

structure MolecularOrbitalTheoryEvidence (M : MolecularOrbitalTheoryPackage) where
  huckelMethodClosed : M.huckelMethod
  symmetryAdaptedLinearCombinationClosed : M.symmetryAdaptedLinearCombination
  frontierOrbitalTheoryClosed : M.frontierOrbitalTheory
  orbitalOrdering : ∀ m, ∀ o1 o2, M.energyLevel o1 ≤ M.energyLevel o2 ∨ M.energyLevel o2 ≤ M.energyLevel o1

def MolecularOrbitalTheoryClosed (M : MolecularOrbitalTheoryPackage) : Prop :=
  M.huckelMethod ∧ M.symmetryAdaptedLinearCombination ∧ M.frontierOrbitalTheory ∧
  (∀ m, ∀ o1 o2 : M.orbital m, M.energyLevel o1 ≤ M.energyLevel o2 ∨ M.energyLevel o2 ≤ M.energyLevel o1)

theorem molecular_orbital_theory_closed_from_evidence (M : MolecularOrbitalTheoryPackage)
    (E : MolecularOrbitalTheoryEvidence M) : MolecularOrbitalTheoryClosed M :=
  And.intro E.huckelMethodClosed (And.intro E.symmetryAdaptedLinearCombinationClosed (And.intro E.frontierOrbitalTheoryClosed E.orbitalOrdering))

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse