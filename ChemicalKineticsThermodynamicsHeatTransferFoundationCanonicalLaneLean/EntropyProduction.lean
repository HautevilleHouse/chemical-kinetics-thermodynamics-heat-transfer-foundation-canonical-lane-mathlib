import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure EntropyProductionPackage where
  irreversibleEntropyProduction : Prop
  dissipationFunction : Prop
  onsagerRelations : Prop
  localEquilibrium : Prop
  entropyBalanceEquation : Prop

structure EntropyProductionEvidence (E : EntropyProductionPackage) where
  irreversibleEntropyProductionClosed : E.irreversibleEntropyProduction
  dissipationFunctionClosed : E.dissipationFunction
  onsagerRelationsClosed : E.onsagerRelations
  localEquilibriumClosed : E.localEquilibrium
  entropyBalanceEquationClosed : E.entropyBalanceEquation

def EntropyProductionClosed (E : EntropyProductionPackage) : Prop :=
  E.irreversibleEntropyProduction ∧ E.dissipationFunction ∧ E.onsagerRelations ∧ E.localEquilibrium ∧ E.entropyBalanceEquation

theorem entropy_production_closed_from_evidence (E : EntropyProductionPackage) (Ev : EntropyProductionEvidence E) :
    EntropyProductionClosed E := by
  exact And.intro Ev.irreversibleEntropyProductionClosed
    (And.intro Ev.dissipationFunctionClosed
      (And.intro Ev.onsagerRelationsClosed
        (And.intro Ev.localEquilibriumClosed Ev.entropyBalanceEquationClosed)))

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse