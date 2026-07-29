import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure HeatTransferModel where
  thermalConductivity : Float
  heatCapacity : Float
  density : Float
  temperatureGradient : Float → Float
  heatFlux : Float

def heatEquationClosed (h : HeatTransferModel) : Prop :=
  h.thermalConductivity > 0 ∧ h.heatCapacity > 0 ∧ h.density > 0

structure HeatTransferEvidence where
  model : HeatTransferModel
  conductivityPositive : model.thermalConductivity > 0
  heatCapacityPositive : model.heatCapacity > 0
  densityPositive : model.density > 0

theorem heat_transfer_closed_from_evidence (h : HeatTransferModel) (e : HeatTransferEvidence) :
  heatEquationClosed h := by
  exact And.intro e.conductivityPositive (And.intro e.heatCapacityPositive e.densityPositive)

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse