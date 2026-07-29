import ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean.ThermodynamicsEquilibrium

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure HeatConductionPackage where
  medium : Type u
  thermalConductivity : Type v
  temperatureField : Type w
  heatFlux : Type x
  fourierLaw : Prop
  specificHeat : Prop
  heatEquation : Prop
  boundaryConditions : Prop

structure HeatConductionEvidence (H : HeatConductionPackage) where
  fourierLawClosed : H.fourierLaw
  specificHeatClosed : H.specificHeat
  heatEquationClosed : H.heatEquation
  boundaryConditionsClosed : H.boundaryConditions

def HeatConductionClosed (H : HeatConductionPackage) : Prop :=
  H.fourierLaw ∧ H.specificHeat ∧ H.heatEquation ∧ H.boundaryConditions

theorem heat_conduction_closed_from_evidence (H : HeatConductionPackage) (E : HeatConductionEvidence H) :
    HeatConductionClosed H := by
  exact And.intro E.fourierLawClosed (And.intro E.specificHeatClosed (And.intro E.heatEquationClosed E.boundaryConditionsClosed))

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse