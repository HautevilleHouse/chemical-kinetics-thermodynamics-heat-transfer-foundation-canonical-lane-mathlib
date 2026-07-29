import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure EquilibriumState where
  temperature : Float
  pressure : Float
  composition : List (String × Float)
  gibbsFreeEnergy : Float
  equilibriumConstant : Float

def equilibriumCondition (e : EquilibriumState) : Prop :=
  e.equilibriumConstant > 0 ∧ e.gibbsFreeEnergy < 0

structure EquilibriumEvidence where
  state : EquilibriumState
  constantPositive : state.equilibriumConstant > 0
  freeEnergyNegative : state.gibbsFreeEnergy < 0

theorem equilibrium_closed_from_evidence (e : EquilibriumState) (ev : EquilibriumEvidence) :
  equilibriumCondition e := by
  exact And.intro ev.constantPositive ev.freeEnergyNegative

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse